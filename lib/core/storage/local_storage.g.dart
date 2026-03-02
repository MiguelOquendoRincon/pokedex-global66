// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Eager provider: SharedPreferences must be initialised before runApp.
/// Overridden in bootstrap.dart after awaiting SharedPreferences.getInstance().

@ProviderFor(localStorage)
final localStorageProvider = LocalStorageProvider._();

/// Eager provider: SharedPreferences must be initialised before runApp.
/// Overridden in bootstrap.dart after awaiting SharedPreferences.getInstance().

final class LocalStorageProvider
    extends $FunctionalProvider<ILocalStorage, ILocalStorage, ILocalStorage>
    with $Provider<ILocalStorage> {
  /// Eager provider: SharedPreferences must be initialised before runApp.
  /// Overridden in bootstrap.dart after awaiting SharedPreferences.getInstance().
  LocalStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localStorageHash();

  @$internal
  @override
  $ProviderElement<ILocalStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ILocalStorage create(Ref ref) {
    return localStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ILocalStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ILocalStorage>(value),
    );
  }
}

String _$localStorageHash() => r'a50fc75c16e89958ac1a5453171286c68ad5c508';
