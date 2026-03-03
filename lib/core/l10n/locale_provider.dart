import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

/// A notifier that manages the application's current locale.
///
/// It defaults to Spanish ('es') and allows forcing a specific language
/// (English or Spanish) or resetting to the device's locale.
@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale? build() => const Locale('es');

  /// Sets the application language to English.
  void setEnglish() => state = const Locale('en');

  /// Sets the application language to Spanish.
  void setSpanish() => state = const Locale('es');

  /// Resets the application language to the device's default locale.
  void resetToDevice() => state = null;

  /// Toggles the application language between English and Spanish.
  void toggle() {
    state = (state?.languageCode == 'es')
        ? const Locale('en')
        : const Locale('es');
  }
}
