import 'package:fpdart/fpdart.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/storage/local_storage.dart';
import 'package:pokedex_global66/features/favorites/domain/entities/favorite_pokemon.dart';
import 'package:pokedex_global66/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_repository_impl.g.dart';

const _kFavoritesKey = 'pokemon_favorites';

class FavoritesRepositoryImpl implements IFavoritesRepository {
  const FavoritesRepositoryImpl(this._storage);
  final ILocalStorage _storage;

  @override
  TaskEither<AppException, List<FavoritePokemon>> getFavorites() => _storage
      .getStringList(_kFavoritesKey)
      .map(
        (rawList) => rawList
            .where((s) => s.isNotEmpty)
            .map(FavoritePokemon.fromStorageString)
            .toList(),
      );

  @override
  TaskEither<AppException, Unit> saveFavorites(
    List<FavoritePokemon> favorites,
  ) => _storage.saveStringList(
    _kFavoritesKey,
    favorites.map((f) => f.toStorageString()).toList(),
  );
}

@riverpod
IFavoritesRepository favoritesRepository(Ref ref) =>
    FavoritesRepositoryImpl(ref.read(localStorageProvider));
