import 'package:flutter/material.dart';
import 'package:pokedex_global66/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

const _kThemeKey = 'theme_mode';

/// A notifier that manages the application's theme mode (light or dark).
///
/// It persists the user's preference in [SharedPreferences].
@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    final prefs = ref.read(sharedPrefsProvider);
    final saved = prefs.getString(_kThemeKey);
    return saved == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  /// Toggles between light and dark theme modes and persists the choice.
  Future<void> toggle() async {
    final next = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    state = next;
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setString(
      _kThemeKey,
      next == ThemeMode.dark ? 'dark' : 'light',
    );
  }
}
