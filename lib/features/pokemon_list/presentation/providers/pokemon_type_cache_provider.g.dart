// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type_cache_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A simple cache that maps a Pokémon's name to its primary type.
/// This allows the list screen to filter by type even if it doesn't have the
/// details fetched, as long as they were fetched at least once.

@ProviderFor(PokemonTypeCache)
final pokemonTypeCacheProvider = PokemonTypeCacheProvider._();

/// A simple cache that maps a Pokémon's name to its primary type.
/// This allows the list screen to filter by type even if it doesn't have the
/// details fetched, as long as they were fetched at least once.
final class PokemonTypeCacheProvider
    extends $NotifierProvider<PokemonTypeCache, Map<String, List<String>>> {
  /// A simple cache that maps a Pokémon's name to its primary type.
  /// This allows the list screen to filter by type even if it doesn't have the
  /// details fetched, as long as they were fetched at least once.
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
  Override overrideWithValue(Map<String, List<String>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, List<String>>>(value),
    );
  }
}

String _$pokemonTypeCacheHash() => r'737ea060da0414deee751a9f44c1aa372dd2b11b';

/// A simple cache that maps a Pokémon's name to its primary type.
/// This allows the list screen to filter by type even if it doesn't have the
/// details fetched, as long as they were fetched at least once.

abstract class _$PokemonTypeCache extends $Notifier<Map<String, List<String>>> {
  Map<String, List<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<Map<String, List<String>>, Map<String, List<String>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, List<String>>, Map<String, List<String>>>,
              Map<String, List<String>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
