import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

/// Holds the current [Locale] for the app.
/// Default: Spanish ('es').
/// Set explicitly to force a language (e.g. from a Settings screen).
@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale? build() => const Locale('es');

  void setEnglish() => state = const Locale('en');
  void setSpanish() => state = const Locale('es');
  void resetToDevice() => state = null;

  void toggle() {
    state = (state?.languageCode == 'es')
        ? const Locale('en')
        : const Locale('es');
  }
}
