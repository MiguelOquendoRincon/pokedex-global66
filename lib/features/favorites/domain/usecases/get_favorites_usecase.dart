// ══════════════════════════════════════════════════════════════════════════════
// features/favorites/domain/usecases/get_favorites_usecase.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/usecase/usecase.dart';
import 'package:pokedex_global66/features/favorites/domain/entities/favorite_pokemon.dart';
import 'package:pokedex_global66/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/favorites_repository_impl.dart';

part 'get_favorites_usecase.g.dart';

class GetFavoritesUseCase implements NoParamsUseCase<List<FavoritePokemon>> {
  const GetFavoritesUseCase(this._repository);
  final IFavoritesRepository _repository;

  @override
  TaskEither<AppException, List<FavoritePokemon>> call() =>
      _repository.getFavorites();
}

@riverpod
GetFavoritesUseCase getFavoritesUseCase(Ref ref) =>
    GetFavoritesUseCase(ref.read(favoritesRepositoryProvider));
