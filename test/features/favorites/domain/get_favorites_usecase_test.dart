// ══════════════════════════════════════════════════════════════════════════════
// test/features/favorites/domain/get_favorites_usecase_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/favorites/domain/entities/favorite_pokemon.dart';
import 'package:pokedex_global66/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:pokedex_global66/features/favorites/domain/usecases/get_favorites_usecase.dart';

class MockFavoritesRepository extends Mock implements IFavoritesRepository {}

void main() {
  late GetFavoritesUseCase useCase;
  late MockFavoritesRepository mockRepo;

  const tFavoritesList = [
    FavoritePokemon(id: 1, name: 'bulbasaur', primaryType: 'grass'),
    FavoritePokemon(id: 25, name: 'pikachu', primaryType: 'electric'),
  ];

  setUp(() {
    mockRepo = MockFavoritesRepository();
    useCase = GetFavoritesUseCase(mockRepo);
  });

  group('GetFavoritesUseCase', () {
    test('calls repository and returns list of favorites on Success', () async {
      // Arrange
      when(
        () => mockRepo.getFavorites(),
      ).thenReturn(TaskEither.right(tFavoritesList));

      // Act
      final result = await useCase().run();

      // Assert
      expect(result, Right(tFavoritesList));
      verify(() => mockRepo.getFavorites()).called(1);
      verifyNoMoreInteractions(mockRepo);
    });

    test('returns AppException when repository call fails', () async {
      // Arrange
      const tException = AppException.storage(message: 'Read error');
      when(
        () => mockRepo.getFavorites(),
      ).thenReturn(TaskEither.left(tException));

      // Act
      final result = await useCase().run();

      // Assert
      expect(result, Left(tException));
      verify(() => mockRepo.getFavorites()).called(1);
    });
  });
}
