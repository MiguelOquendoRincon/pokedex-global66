// ══════════════════════════════════════════════════════════════════════════════
// features/favorites/domain/usecases/toggle_favorite_usecase.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/usecase/usecase.dart';
import 'package:pokedex_global66/features/favorites/domain/entities/favorite_pokemon.dart';
import 'package:pokedex_global66/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/favorites_repository_impl.dart';

part 'toggle_favorite_usecase.freezed.dart';
part 'toggle_favorite_usecase.g.dart';

/// Parameters for toggling a Pokémon's favorite status.
@freezed
abstract class ToggleFavoriteParams with _$ToggleFavoriteParams {
  const factory ToggleFavoriteParams({
    required FavoritePokemon pokemon,
    required List<FavoritePokemon> currentFavorites,
  }) = _ToggleFavoriteParams;
}

/// A use case that toggles the favorite status of a Pokémon.
///
/// It returns the updated list after adding or removing the Pokémon.
/// The repository ensures the updated list is persisted.
class ToggleFavoriteUseCase
    implements UseCase<List<FavoritePokemon>, ToggleFavoriteParams> {
  const ToggleFavoriteUseCase(this._repository);
  final IFavoritesRepository _repository;

  @override
  TaskEither<AppException, List<FavoritePokemon>> call(
    ToggleFavoriteParams params,
  ) {
    final updated = _toggle(
      pokemon: params.pokemon,
      current: params.currentFavorites,
    );
    // Chain: persist → then return the updated list
    return _repository.saveFavorites(updated).map((_) => updated);
  }

  /// Pure function — no I/O, fully unit-testable without mocks.
  List<FavoritePokemon> _toggle({
    required FavoritePokemon pokemon,
    required List<FavoritePokemon> current,
  }) {
    final alreadyFavorite = current.any((f) => f.id == pokemon.id);
    return alreadyFavorite
        ? current.where((f) => f.id != pokemon.id).toList()
        : [...current, pokemon];
  }
}

/// A provider that exposes an instance of [ToggleFavoriteUseCase].
@riverpod
ToggleFavoriteUseCase toggleFavoriteUseCase(Ref ref) =>
    ToggleFavoriteUseCase(ref.read(favoritesRepositoryProvider));
