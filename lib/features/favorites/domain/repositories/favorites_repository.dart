// ══════════════════════════════════════════════════════════════════════════════
// features/favorites/domain/repositories/favorites_repository.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';

import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/favorites/domain/entities/favorite_pokemon.dart';

abstract interface class IFavoritesRepository {
  /// Returns the full list of saved favorites from local storage.
  TaskEither<AppException, List<FavoritePokemon>> getFavorites();

  /// Persists the complete updated list (overwrite strategy — simpler than
  /// individual add/remove operations on SharedPreferences).
  TaskEither<AppException, Unit> saveFavorites(List<FavoritePokemon> favorites);
}
