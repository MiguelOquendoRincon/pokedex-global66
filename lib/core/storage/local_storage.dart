import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../error/app_exception.dart';

part 'local_storage.g.dart';

/// Enum to represent font size preferences
/// This enum defines different font size options that can be used in the application.
enum FontSizePreference { small, medium, large, extraLarge }

/// Interface so we can swap SharedPreferences for Hive/Isar in tests or future.
abstract interface class ILocalStorage {
  /// Persists a list of strings associated with a specific [key].
  TaskEither<AppException, Unit> saveStringList(String key, List<String> value);

  /// Retrieves a list of strings associated with a specific [key].
  TaskEither<AppException, List<String>> getStringList(String key);

  /// Retrieves the stored user name.
  TaskEither<AppException, String> getUserName();

  /// Persists the user name associated with a specific [key].
  TaskEither<AppException, bool> setUserName(String key, String value);

  /// Retrieves the theme preference (light/dark) associated with a specific [key].
  TaskEither<AppException, bool> getDarkTheme(String key);

  /// Persists the theme preference associated with a specific [key].
  TaskEither<AppException, bool> setDarkTheme(String key, bool value);

  /// Retrieves the font size preference associated with a specific [key].
  TaskEither<AppException, FontSizePreference> getFontSize(String key);

  /// Persists the font size preference associated with a specific [key].
  TaskEither<AppException, bool> setFontSize(
    String key,
    FontSizePreference value,
  );

  /// Retrieves the screen width associated with a specific [key].
  TaskEither<AppException, double> getScreenWidth(String key);

  /// Persists the screen width associated with a specific [key].
  TaskEither<AppException, bool> setScreenWidth(String key, double width);

  /// Retrieves the onboarding completion status associated with a specific [key].
  TaskEither<AppException, bool> getHasOnboarded(String key);

  /// Persists the onboarding completion status associated with a specific [key].
  TaskEither<AppException, bool> setHasOnboarded(String key, bool value);
}

class SharedPrefsLocalStorage implements ILocalStorage {
  const SharedPrefsLocalStorage(this._prefs);
  final SharedPreferences _prefs;

  @override
  TaskEither<AppException, Unit> saveStringList(
    String key,
    List<String> value,
  ) => TaskEither.tryCatch(() async {
    await _prefs.setStringList(key, value);
    return unit;
  }, (e, _) => AppException.storage(message: e.toString()));

  @override
  TaskEither<AppException, List<String>> getStringList(String key) =>
      TaskEither.tryCatch(
        () async => _prefs.getStringList(key) ?? [],
        (e, _) => AppException.storage(message: e.toString()),
      );

  @override
  TaskEither<AppException, bool> getDarkTheme(String key) {
    return TaskEither.tryCatch(
      () async => _prefs.getBool(key) ?? false,
      (e, _) => AppException.storage(message: e.toString()),
    );
  }

  @override
  TaskEither<AppException, FontSizePreference> getFontSize(String key) {
    return TaskEither.tryCatch(
      () async =>
          FontSizePreference.values.byName(_prefs.getString(key) ?? 'medium'),
      (e, _) => AppException.storage(message: e.toString()),
    );
  }

  @override
  TaskEither<AppException, bool> getHasOnboarded(String key) {
    return TaskEither.tryCatch(
      () async => _prefs.getBool(key) ?? false,
      (e, _) => AppException.storage(message: e.toString()),
    );
  }

  @override
  TaskEither<AppException, double> getScreenWidth(String key) {
    return TaskEither.tryCatch(
      () async => _prefs.getDouble(key) ?? 360.0,
      (e, _) => AppException.storage(message: e.toString()),
    );
  }

  @override
  TaskEither<AppException, String> getUserName() {
    return TaskEither.tryCatch(
      () async => _prefs.getString('userName') ?? "No hay información",
      (e, _) => AppException.storage(message: e.toString()),
    );
  }

  @override
  TaskEither<AppException, bool> setDarkTheme(String key, bool value) {
    return TaskEither.tryCatch(
      () async => await _prefs.setBool(key, value),
      (e, _) => AppException.storage(message: e.toString()),
    );
  }

  @override
  TaskEither<AppException, bool> setFontSize(
    String key,
    FontSizePreference value,
  ) {
    return TaskEither.tryCatch(
      () async => await _prefs.setString(key, value.name),
      (e, _) => AppException.storage(message: e.toString()),
    );
  }

  @override
  TaskEither<AppException, bool> setHasOnboarded(String key, bool value) {
    return TaskEither.tryCatch(
      () async => await _prefs.setBool(key, value),
      (e, _) => AppException.storage(message: e.toString()),
    );
  }

  @override
  TaskEither<AppException, bool> setScreenWidth(String key, double width) {
    return TaskEither.tryCatch(
      () async => await _prefs.setDouble(key, width),
      (e, _) => AppException.storage(message: e.toString()),
    );
  }

  @override
  TaskEither<AppException, bool> setUserName(String key, String value) {
    return TaskEither.tryCatch(
      () async => await _prefs.setString(key, value),
      (e, _) => AppException.storage(message: e.toString()),
    );
  }
}

/// Eager provider: SharedPreferences must be initialised before runApp.
/// Overridden in bootstrap.dart after awaiting SharedPreferences.getInstance().
@Riverpod(keepAlive: true)
ILocalStorage localStorage(Ref ref) => throw UnimplementedError(
  'localStorageProvider must be overridden in bootstrap.dart',
);
