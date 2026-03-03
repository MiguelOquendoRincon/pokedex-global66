import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_type_cache_provider.g.dart';

/// A simple cache that maps a Pokémon's name to its primary type.
/// This allows the list screen to filter by type even if it doesn't have the
/// details fetched, as long as they were fetched at least once.
@Riverpod(keepAlive: true)
class PokemonTypeCache extends _$PokemonTypeCache {
  @override
  Map<String, List<String>> build() => {};

  void register(String name, List<String> types) {
    state = {...state, name: types};
  }

  void registerMany(Map<String, List<String>> types) {
    state = {...state, ...types};
  }
}
