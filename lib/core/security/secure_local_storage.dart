import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/storage/local_storage.dart';

/// Secure implementation of [ILocalStorage] using [FlutterSecureStorage].
///
/// On Android: Secure storage using AES-GCM and RSA key wrapping,
///   backed by the Android Keystore (replaces deprecated EncryptedSharedPreferences).
/// On iOS: Keychain Services with kSecAttrAccessibleAfterFirstUnlock.
///   → Data survives app restart but is inaccessible before first unlock.
///
/// The stored format for lists is JSON-encoded:
///   key → '["25:pikachu:electric","1:bulbasaur:grass"]'
///
/// Drop-in replacement for [SharedPrefsLocalStorage] — same interface,
/// zero changes required in repositories or use cases (DIP + OCP).
final class SecureLocalStorage implements ILocalStorage {
  SecureLocalStorage()
    : _storage = const FlutterSecureStorage(
        // Android: Secure storage (AES-GCM + RSA OAEP)
        aOptions: AndroidOptions(
          keyCipherAlgorithm:
              KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
          storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
        ),
        // iOS: accessible only after first device unlock (balanced security/UX)
        iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      );

  final FlutterSecureStorage _storage;

  @override
  TaskEither<AppException, List<String>> getStringList(String key) =>
      TaskEither.tryCatch(
        () async {
          final raw = await _storage.read(key: key);
          if (raw == null || raw.isEmpty) return const [];
          final decoded = jsonDecode(raw);
          if (decoded is! List) return const [];
          return decoded.cast<String>();
        },
        (e, _) => AppException.storage(
          message: 'SecureStorage read failed for key "$key": $e',
        ),
      );

  @override
  TaskEither<AppException, Unit> saveStringList(
    String key,
    List<String> value,
  ) => TaskEither.tryCatch(
    () async {
      final encoded = jsonEncode(value);
      await _storage.write(key: key, value: encoded);
      return unit;
    },
    (e, _) => AppException.storage(
      message: 'SecureStorage write failed for key "$key": $e',
    ),
  );

  @override
  TaskEither<AppException, bool> getDarkTheme(String key) {
    return TaskEither.tryCatch(
      () async {
        final raw = await _storage.read(key: key);
        if (raw == null || raw.isEmpty) return false;
        return raw == 'true';
      },
      (e, _) => AppException.storage(
        message: 'SecureStorage read failed for key "$key": $e',
      ),
    );
  }

  @override
  TaskEither<AppException, FontSizePreference> getFontSize(String key) {
    return TaskEither.tryCatch(
      () async {
        final raw = await _storage.read(key: key);
        if (raw == null || raw.isEmpty) return FontSizePreference.medium;
        return FontSizePreference.values.firstWhere(
          (e) => e.name == raw,
          orElse: () => FontSizePreference.medium,
        );
      },
      (e, _) => AppException.storage(
        message: 'SecureStorage read failed for key "$key": $e',
      ),
    );
  }

  @override
  TaskEither<AppException, bool> getHasOnboarded(String key) {
    return TaskEither.tryCatch(
      () async {
        final raw = await _storage.read(key: key);
        if (raw == null || raw.isEmpty) return false;
        return raw == 'true';
      },
      (e, _) => AppException.storage(
        message: 'SecureStorage read failed for key "$key": $e',
      ),
    );
  }

  @override
  TaskEither<AppException, double> getScreenWidth(String key) {
    return TaskEither.tryCatch(
      () async {
        final raw = await _storage.read(key: key);
        if (raw == null || raw.isEmpty) return 0.0;
        return double.parse(raw);
      },
      (e, _) => AppException.storage(
        message: 'SecureStorage read failed for key "$key": $e',
      ),
    );
  }

  @override
  TaskEither<AppException, String> getUserName() {
    return TaskEither.tryCatch(
      () async {
        final raw = await _storage.read(key: 'user_name');
        if (raw == null || raw.isEmpty) return '';
        return raw;
      },
      (e, _) => AppException.storage(
        message: 'SecureStorage read failed for key "user_name": $e',
      ),
    );
  }

  @override
  TaskEither<AppException, bool> setDarkTheme(String key, bool value) {
    return TaskEither.tryCatch(
      () async {
        await _storage.write(key: key, value: value.toString());
        return true;
      },
      (e, _) => AppException.storage(
        message: 'SecureStorage write failed for key "$key": $e',
      ),
    );
  }

  @override
  TaskEither<AppException, bool> setFontSize(
    String key,
    FontSizePreference value,
  ) {
    return TaskEither.tryCatch(
      () async {
        await _storage.write(key: key, value: value.name);
        return true;
      },
      (e, _) => AppException.storage(
        message: 'SecureStorage write failed for key "$key": $e',
      ),
    );
  }

  @override
  TaskEither<AppException, bool> setHasOnboarded(String key, bool value) {
    return TaskEither.tryCatch(
      () async {
        await _storage.write(key: key, value: value.toString());
        return true;
      },
      (e, _) => AppException.storage(
        message: 'SecureStorage write failed for key "$key": $e',
      ),
    );
  }

  @override
  TaskEither<AppException, bool> setScreenWidth(String key, double width) {
    return TaskEither.tryCatch(
      () async {
        await _storage.write(key: key, value: width.toString());
        return true;
      },
      (e, _) => AppException.storage(
        message: 'SecureStorage write failed for key "$key": $e',
      ),
    );
  }

  @override
  TaskEither<AppException, bool> setUserName(String key, String value) {
    return TaskEither.tryCatch(
      () async {
        await _storage.write(key: key, value: value);
        return true;
      },
      (e, _) => AppException.storage(
        message: 'SecureStorage write failed for key "$key": $e',
      ),
    );
  }
}
