// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PokemonListNotifier)
final pokemonListProvider = PokemonListNotifierProvider._();

final class PokemonListNotifierProvider
    extends $NotifierProvider<PokemonListNotifier, PokemonListState> {
  PokemonListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokemonListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokemonListNotifierHash();

  @$internal
  @override
  PokemonListNotifier create() => PokemonListNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PokemonListState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PokemonListState>(value),
    );
  }
}

String _$pokemonListNotifierHash() =>
    r'6cd6d813c48a3a07c5cfb47a5233c90b7fc23c6d';

abstract class _$PokemonListNotifier extends $Notifier<PokemonListState> {
  PokemonListState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PokemonListState, PokemonListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PokemonListState, PokemonListState>,
              PokemonListState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(PokemonTypeCache)
final pokemonTypeCacheProvider = PokemonTypeCacheProvider._();

final class PokemonTypeCacheProvider
    extends $NotifierProvider<PokemonTypeCache, Map<String, String>> {
  PokemonTypeCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokemonTypeCacheProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokemonTypeCacheHash();

  @$internal
  @override
  PokemonTypeCache create() => PokemonTypeCache();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, String>>(value),
    );
  }
}

String _$pokemonTypeCacheHash() => r'da2e81c1d1d229e912bc3c247055e9c0ce4f57bd';

abstract class _$PokemonTypeCache extends $Notifier<Map<String, String>> {
  Map<String, String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Map<String, String>, Map<String, String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, String>, Map<String, String>>,
              Map<String, String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
