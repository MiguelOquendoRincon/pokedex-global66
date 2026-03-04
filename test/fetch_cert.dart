import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';

void main() async {
  const host = 'pokeapi.co';
  try {
    final socket = await SecureSocket.connect(host, 443);
    final cert = socket.peerCertificate;
    if (cert == null) {
      if (kDebugMode) {
        print('No certificate found');
      }
      return;
    }

    if (kDebugMode) {
      print('Subject: ${cert.subject}');
      print('Issuer: ${cert.issuer}');
      print('Start: ${cert.startValidity}');
      print('End: ${cert.endValidity}');
    }

    final digest = sha256.convert(cert.der);
    final hash = base64.encode(digest.bytes);
    if (kDebugMode) {
      print('SHA-256 Hash for $host: $hash');
    }
    await socket.close();
  } catch (e) {
    if (kDebugMode) {
      print('Error: $e');
    }
  }
}
