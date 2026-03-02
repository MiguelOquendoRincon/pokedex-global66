// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds the current [Locale] for the app.
/// Default: device locale (null) → Flutter resolves automatically.
/// Set explicitly to force a language (e.g. from a Settings screen).

@ProviderFor(LocaleNotifier)
final localeProvider = LocaleNotifierProvider._();

/// Holds the current [Locale] for the app.
/// Default: device locale (null) → Flutter resolves automatically.
/// Set explicitly to force a language (e.g. from a Settings screen).
final class LocaleNotifierProvider
    extends $NotifierProvider<LocaleNotifier, Locale?> {
  /// Holds the current [Locale] for the app.
  /// Default: device locale (null) → Flutter resolves automatically.
  /// Set explicitly to force a language (e.g. from a Settings screen).
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

String _$localeNotifierHash() => r'b2e4cfff11ece743286704617ffdaf24f271e6fc';

/// Holds the current [Locale] for the app.
/// Default: device locale (null) → Flutter resolves automatically.
/// Set explicitly to force a language (e.g. from a Settings screen).

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
