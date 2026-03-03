import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Validates that the TLS certificate presented by the server matches
/// a known SHA-256 fingerprint.
///
/// Current hash for pokeapi.co (March 2024):
/// Certificate SHA-256: CyG5OUdNYJ/5Jna5H5pUS9BghNHOL5RjcjMx11yTCqk=
final class CertificatePinningInterceptor extends Interceptor {
  CertificatePinningInterceptor({required this.talker});

  final Talker talker;

  // The Set of pinned SHA-256 fingerprints (Base64).
  // Current hash for pokeapi.co (March 2024):
  // Certificate SHA-256: CyG5OUdNYJ/5Jna5H5pUS9BghNHOL5RjcjMx11yTCqk=
  // To update the hash:
  // 1. Run on Windows:
  //    - `openssl s_client -connect pokeapi.co:443 -servername pokeapi.co | openssl x509 -outform DER | openssl dgst -sha256 -binary | openssl base64`
  //    On Mac/Linux
  //    - `openssl s_client -connect pokeapi.co:443 -servername pokeapi.co </dev/null 2>/dev/null | openssl x509 -outform DER | openssl dgst -sha256 -binary | openssl base64`
  // 2. Copy the output hash
  // 3. Replace the hash in the set below
  static const Set<String> _pinnedHashes = {
    'CyG5OUdNYJ/5Jna5H5pUS9BghNHOL5RjcjMx11yTCqk=', // Primary (PokeAPI Cert)
    'h6801m+z8v3zbgkRH6jgve87mPj6vG87mPj6vG87mPj=', // Placeholder backup
  };

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // In debug / profile mode skip pinning or just log it.
    if (!kReleaseMode) {
      talker.debug('[CertPin] Pinning skipped in non-release mode');
      handler.next(options);
      return;
    }

    // Pinning is actually enforced in the IOHttpClientAdapter.
    // This interceptor can be used for logging or early rejection if needed.
    handler.next(options);
  }
}

/// Configures Dio to use a pinning-aware HttpClient adapter.
/// Call this in [DioClient] after creating the instance.
/// Configures Dio to use a pinning-aware HttpClient adapter.
///
/// This function sets up the [IOHttpClientAdapter] for the [dio] instance,
/// ensuring that all requests validate the server's certificate against
/// the pinned SHA-256 fingerprints.
void applyPinningAdapter(Dio dio, Talker talker) {
  // In debug mode, we usually don't want to break the connection for dev tools like Charles.
  if (!kReleaseMode) return;

  final client = HttpClient()
    ..badCertificateCallback = (X509Certificate cert, String host, int port) {
      talker.warning('[CertPin] Bad cert rejected for $host:$port');
      return false;
    };

  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () => client,
    validateCertificate: (cert, host, port) {
      if (cert == null) {
        talker.error('[CertPin] Null certificate for $host');
        return false;
      }

      // Compute SHA-256 of the DER-encoded certificate.
      final hash = _computeHash(cert.der);
      final isValid = CertificatePinningInterceptor._pinnedHashes.contains(
        hash,
      );

      if (!isValid) {
        talker.critical('[CertPin] Pin mismatch for $host! Got: $hash');
      } else {
        talker.verbose('[CertPin] Verified $host');
      }

      return isValid;
    },
  );
}

String _computeHash(Uint8List der) {
  final digest = sha256.convert(der);
  return base64.encode(digest.bytes);
}
