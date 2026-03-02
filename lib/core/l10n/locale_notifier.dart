import 'dart:ui';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_notifier.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale? build() {
    return null;
  }

  void setLocale(Locale locale) {
    state = locale;
  }
}
