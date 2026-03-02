// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_talker.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Singleton [Talker] instance used across the entire app.
/// Exposed as a Riverpod provider so it can be injected into
/// interceptors, use-cases and tested with overrides.

@ProviderFor(talker)
final talkerProvider = TalkerProvider._();

/// Singleton [Talker] instance used across the entire app.
/// Exposed as a Riverpod provider so it can be injected into
/// interceptors, use-cases and tested with overrides.

final class TalkerProvider extends $FunctionalProvider<Talker, Talker, Talker>
    with $Provider<Talker> {
  /// Singleton [Talker] instance used across the entire app.
  /// Exposed as a Riverpod provider so it can be injected into
  /// interceptors, use-cases and tested with overrides.
  TalkerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'talkerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$talkerHash();

  @$internal
  @override
  $ProviderElement<Talker> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Talker create(Ref ref) {
    return talker(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Talker value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Talker>(value),
    );
  }
}

String _$talkerHash() => r'a7087cd07beb7549ceea98f99bcb20729bee4f39';
