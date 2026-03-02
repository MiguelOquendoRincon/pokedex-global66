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

@freezed
abstract class ToggleFavoriteParams with _$ToggleFavoriteParams {
  const factory ToggleFavoriteParams({
    required FavoritePokemon pokemon,
    required List<FavoritePokemon> currentFavorites,
  }) = _ToggleFavoriteParams;
}

/// Returns the updated list after toggling.
/// Pure domain logic: add if absent, remove if present.
/// No side-effect knowledge — the repository handles persistence.
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

@riverpod
ToggleFavoriteUseCase toggleFavoriteUseCase(Ref ref) =>
    ToggleFavoriteUseCase(ref.read(favoritesRepositoryProvider));
