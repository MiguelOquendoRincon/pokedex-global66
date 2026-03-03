// ══════════════════════════════════════════════════════════════════════════════
// features/favorites/presentation/providers/favorites_provider.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pokedex_global66/features/pokemon_detail/domain/entities/pokemon_details.dart';
import '../../domain/entities/favorite_pokemon.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/toggle_favorite_usecase.dart';

part 'favorites_provider.g.dart';

/// A notifier that manages the list of favorite Pokémon.
///
/// It handles loading favorites from local storage on initialization and
/// providing methods to toggle the favorite status of a Pokémon.
@Riverpod(keepAlive: true)
class FavoritesNotifier extends _$FavoritesNotifier {
  @override
  List<FavoritePokemon> build() {
    // Initial load happens in the background.
    // bootstrap.dart warmUp calls container.read, triggering this.
    scheduleMicrotask(_load);
    return [];
  }

  Future<void> _load() async {
    final result = await ref.read(getFavoritesUseCaseProvider).call().run();
    result.match(
      (error) => null, // In a real app, handle or log the error
      (favorites) => state = favorites,
    );
  }

  /// Toggles the favorite status of a Pokémon using a [PokemonDetail].
  Future<void> toggle(PokemonDetail detail) async {
    final favorite = FavoritePokemon(
      id: detail.id,
      name: detail.name,
      primaryType: detail.primaryType,
    );

    final result = await ref
        .read(toggleFavoriteUseCaseProvider)
        .call(ToggleFavoriteParams(pokemon: favorite, currentFavorites: state))
        .run();

    result.match(
      (error) => null, // Handle error
      (updated) => state = updated,
    );
  }

  /// Toggles the favorite status of a Pokémon using basic information from the list.
  ///
  /// This doesn't require a full [PokemonDetail] object, making it suitable
  /// for use directly from the list screen.
  Future<void> toggleFromList({
    required int id,
    required String name,
    required String primaryType,
  }) async {
    final favorite = FavoritePokemon(
      id: id,
      name: name,
      primaryType: primaryType,
    );

    final result = await ref
        .read(toggleFavoriteUseCaseProvider)
        .call(ToggleFavoriteParams(pokemon: favorite, currentFavorites: state))
        .run();

    result.match((error) => null, (updated) => state = updated);
  }
}
