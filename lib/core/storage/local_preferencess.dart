import 'package:shared_preferences/shared_preferences.dart';

/// Enum to represent font size preferences
/// This enum defines different font size options that can be used in the application.
enum FontSizePreference { small, medium, large, extraLarge }

/// UserPreferences class to manage user preferences
/// This class provides methods to get and set user preferences such as font size and screen width.
class UserPreferences {
  static const _fontSizeKey = 'font_size';
  static const _screenWidthKey = 'screen_width';

  final SharedPreferences _prefs;

  UserPreferences(this._prefs);

  //Save User Name.
  String get userName {
    return _prefs.getString('userName') ?? "No hay información";
  }

  set userName(String value) {
    _prefs.setString('userName', value);
  }

  /// Get dark theme preference
  bool get darkTheme => _prefs.getBool('dark_theme') ?? false;

  /// Set dark theme preference
  Future<void> setDarkTheme(bool value) async {
    await _prefs.setBool('dark_theme', value);
  }

  /// Get the current font size preference
  /// This method retrieves the font size preference from shared preferences.
  FontSizePreference get fontSize {
    final name = _prefs.getString(_fontSizeKey) ?? 'medium';
    return FontSizePreference.values.byName(name);
  }

  /// Set the font size preference
  /// This method saves the font size preference to shared preferences.
  Future<void> setFontSize(FontSizePreference value) async {
    await _prefs.setString(_fontSizeKey, value.name);
  }

  /// Get the screen width preference
  /// This method retrieves the screen width from shared preferences.
  double get screenWidth => _prefs.getDouble(_screenWidthKey) ?? 360.0;

  /// Set the screen width preference
  /// This method saves the screen width to shared preferences.
  Future<void> setScreenWidth(double width) async {
    await _prefs.setDouble(_screenWidthKey, width);
  }

  /// Set if it's the first launch of the app
  /// This method saves a boolean indicating if the app has been launched before.
  bool get hasOnboarded {
    return _prefs.getBool('onboarded') ?? false;
  }

  /// Set the onboarded status
  /// This method saves a boolean indicating if the user has completed onboarding.
  Future<void> setHasOnboarded(bool value) async {
    await _prefs.setBool('onboarded', value);
  }
}
