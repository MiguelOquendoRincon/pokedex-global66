// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier that manages the application's current locale.
///
/// It defaults to Spanish ('es') and allows forcing a specific language
/// (English or Spanish) or resetting to the device's locale.

@ProviderFor(LocaleNotifier)
final localeProvider = LocaleNotifierProvider._();

/// A notifier that manages the application's current locale.
///
/// It defaults to Spanish ('es') and allows forcing a specific language
/// (English or Spanish) or resetting to the device's locale.
final class LocaleNotifierProvider
    extends $NotifierProvider<LocaleNotifier, Locale?> {
  /// A notifier that manages the application's current locale.
  ///
  /// It defaults to Spanish ('es') and allows forcing a specific language
  /// (English or Spanish) or resetting to the device's locale.
  LocaleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeNotifierHash();

  @$internal
  @override
  LocaleNotifier create() => LocaleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale?>(value),
    );
  }
}

String _$localeNotifierHash() => r'bdc748d395ffbdf84fa8ce21e03403732359c53c';

/// A notifier that manages the application's current locale.
///
/// It defaults to Spanish ('es') and allows forcing a specific language
/// (English or Spanish) or resetting to the device's locale.

abstract class _$LocaleNotifier extends $Notifier<Locale?> {
  Locale? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Locale?, Locale?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale?, Locale?>,
              Locale?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
