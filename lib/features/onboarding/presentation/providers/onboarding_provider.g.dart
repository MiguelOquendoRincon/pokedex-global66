// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Persisted bool: has the user completed the onboarding?
/// keepAlive: true → survives navigation, router redirect reads it reactively.

@ProviderFor(OnboardingDone)
final onboardingDoneProvider = OnboardingDoneProvider._();

/// Persisted bool: has the user completed the onboarding?
/// keepAlive: true → survives navigation, router redirect reads it reactively.
final class OnboardingDoneProvider
    extends $NotifierProvider<OnboardingDone, bool> {
  /// Persisted bool: has the user completed the onboarding?
  /// keepAlive: true → survives navigation, router redirect reads it reactively.
  OnboardingDoneProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingDoneProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingDoneHash();

  @$internal
  @override
  OnboardingDone create() => OnboardingDone();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$onboardingDoneHash() => r'f91533595fd1f4272062e3a53d00fb2a827afacc';

/// Persisted bool: has the user completed the onboarding?
/// keepAlive: true → survives navigation, router redirect reads it reactively.

abstract class _$OnboardingDone extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Internal provider for [SharedPreferences].
///
/// It must be overridden in the [ProviderScope] (e.g., in `bootstrap.dart`).

@ProviderFor(sharedPrefs)
final sharedPrefsProvider = SharedPrefsProvider._();

/// Internal provider for [SharedPreferences].
///
/// It must be overridden in the [ProviderScope] (e.g., in `bootstrap.dart`).

final class SharedPrefsProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  /// Internal provider for [SharedPreferences].
  ///
  /// It must be overridden in the [ProviderScope] (e.g., in `bootstrap.dart`).
  SharedPrefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPrefsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPrefsHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPrefs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPrefsHash() => r'83531dca12c2a4cac0e24e283d9ffb60edb23618';
