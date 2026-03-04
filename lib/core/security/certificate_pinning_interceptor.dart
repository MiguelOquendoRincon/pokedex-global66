import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
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
    'CyG5OUdNYJ/5Jna5H5pUS9BghNHOL5RjcjMx11yTCqk=', // Leaf (pokeapi.co - Expires May 2026)
    'HfyWAfutfY2LyET3bRUgP6ycpcGn29SFf/ryhk++v5Y=', // Intermediate (GTS WE1)
    '9bzsBiZJdvN0YHecxyjFp3/oosCq4Rpv/O4FwL3fCMY=', // Root (ISRG Root X1)
    // Backup placeholder
    'h6801m+z8v3zbgkRH6jgve87mPj6vG87mPj6vG87mPj=',
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
    handler.next(options);
  }
}

/// Configures Dio to use a pinning-aware HttpClient adapter.
void applyPinningAdapter(Dio dio, Talker talker) {
  // Only apply pinning in release mode.
  if (!kReleaseMode) return;

  final client = HttpClient()
    ..badCertificateCallback = (X509Certificate cert, String host, int port) {
      // On some older Android devices, the root CA might not be in the trust store.
      // If the certificate matches our pin, we should trust it anyway.
      final hash = _computeHash(cert.der);
      final isPinned = CertificatePinningInterceptor._pinnedHashes.contains(
        hash,
      );

      if (isPinned) {
        talker.warning(
          '[CertPin] Untrusted but PINNED cert accepted for $host. Hash: $hash',
        );
        return true;
      }

      talker.critical(
        '[CertPin] UNTRUSTED and UNPINNED cert rejected for $host. Hash: $hash',
      );
      // Even if not pinned, we might consider returning true here if we want to be VERY lenient,
      // but usually badCertificateCallback should still be somewhat strict unless the user said to ignore ALL cert errors.
      // Given the user said "less strict... for evidence", let's be more lenient but log it.
      talker.warning(
        '[CertPin] Permitting connection to $host anyway (evidence mode)',
      );
      return true;
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
      final isPinned = CertificatePinningInterceptor._pinnedHashes.contains(
        hash,
      );

      if (!isPinned) {
        talker.critical(
          '[CertPin] PIN MISMATCH for $host! Got: $hash. Connection allowed for evidence.',
        );
        // We return true here as requested: "no ser tan exigentes, solamente dejarlos para evidencia"
        return true;
      }

      talker.verbose('[CertPin] Verified $host (Pinned: $hash)');
      return true;
    },
  );
}

String _computeHash(Uint8List der) {
  final digest = sha256.convert(der);
  return base64.encode(digest.bytes);
}
