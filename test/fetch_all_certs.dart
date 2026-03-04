import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';

void main() async {
  const host = 'pokeapi.co';
  // Create a connection where we catch the cert.
  // Although HttpClient doesn't easily expose the chain for a valid cert,
  // we can use it to fetch and see if we can get it via a hack or by just connecting.

  try {
    final socket = await SecureSocket.connect(
      host,
      443,
      onBadCertificate: (cert) {
        // This only triggers if cert is bad.
        return true;
      },
    );

    // Peer certificate is always the leaf.
    final leaf = socket.peerCertificate!;

    if (kDebugMode) {
      print('Leaf Subject: ${leaf.subject}');
    }
    if (kDebugMode) {
      print('Leaf Issuer: ${leaf.issuer}');
    }
    final leafHash = base64.encode(sha256.convert(leaf.der).bytes);
    if (kDebugMode) {
      print('Leaf SHA-256: $leafHash');
    }

    // In Dart, there is no easy way to get the full chain from SecureSocket
    // unless the server doesn't provide a valid chain and we look at it in onBadCertificate?
    // Actually, X509Certificate doesn't have a 'parent' or 'issuerCert' in dart:io.

    await socket.close();

    // Let's try to get more info by searching for the CN=WE1 (the issuer) hash.
  } catch (e) {
    if (kDebugMode) {
      print('Error: $e');
    }
  }
}
