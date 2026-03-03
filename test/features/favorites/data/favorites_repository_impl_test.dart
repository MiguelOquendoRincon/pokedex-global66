// ══════════════════════════════════════════════════════════════════════════════
// test/features/favorites/data/favorites_repository_impl_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/storage/local_storage.dart';
import 'package:pokedex_global66/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:pokedex_global66/features/favorites/domain/entities/favorite_pokemon.dart';

class MockLocalStorage extends Mock implements ILocalStorage {}

const _kFavoritesKey = 'pokemon_favorites';

void main() {
  late FavoritesRepositoryImpl repository;
  late MockLocalStorage mockStorage;

  const tFavorites = [
    FavoritePokemon(id: 1, name: 'bulbasaur', primaryType: 'grass'),
    FavoritePokemon(id: 25, name: 'pikachu', primaryType: 'electric'),
  ];

  const tStringList = ['1:bulbasaur:grass', '25:pikachu:electric'];

  setUp(() {
    mockStorage = MockLocalStorage();
    repository = FavoritesRepositoryImpl(mockStorage);
  });

  group('FavoritesRepositoryImpl — getFavorites', () {
    test('successfully fetches and maps favorites from storage', () async {
      // Arrange
      when(
        () => mockStorage.getStringList(_kFavoritesKey),
      ).thenReturn(TaskEither.right(tStringList));

      // Act
      final result = await repository.getFavorites().run();

      // Assert
      expect(result, isA<Right<AppException, List<FavoritePokemon>>>());
      result.fold(
        (_) => fail('Expected Right'),
        (list) => expect(list, equals(tFavorites)),
      );
    });

    test('returns empty list if storage returns empty list', () async {
      // Arrange
      when(
        () => mockStorage.getStringList(_kFavoritesKey),
      ).thenReturn(TaskEither.right([]));

      // Act
      final result = await repository.getFavorites().run();

      // Assert
      expect(result, isA<Right<AppException, List<FavoritePokemon>>>());
      result.fold(
        (_) => fail('Expected Right'),
        (list) => expect(list, isEmpty),
      );
    });

    test('returns AppException if storage fails', () async {
      // Arrange
      const tException = AppException.storage(message: 'Fatal read failure');
      when(
        () => mockStorage.getStringList(_kFavoritesKey),
      ).thenReturn(TaskEither.left(tException));

      // Act
      final result = await repository.getFavorites().run();

      // Assert
      expect(result, Left(tException));
    });
  });

  group('FavoritesRepositoryImpl — saveFavorites', () {
    test('successfully serialises and saves favorites', () async {
      // Arrange
      when(
        () => mockStorage.saveStringList(_kFavoritesKey, any()),
      ).thenReturn(TaskEither.right(unit));

      // Act
      final result = await repository.saveFavorites(tFavorites).run();

      // Assert
      expect(result, Right(unit));
      verify(
        () => mockStorage.saveStringList(_kFavoritesKey, tStringList),
      ).called(1);
    });

    test('returns AppException if storage write fails', () async {
      // Arrange
      const tException = AppException.storage(message: 'Disk full');
      when(
        () => mockStorage.saveStringList(_kFavoritesKey, any()),
      ).thenReturn(TaskEither.left(tException));

      // Act
      final result = await repository.saveFavorites(tFavorites).run();

      // Assert
      expect(result, Left(tException));
    });
  });
}
