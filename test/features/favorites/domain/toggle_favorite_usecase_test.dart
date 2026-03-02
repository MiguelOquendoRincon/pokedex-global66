// ══════════════════════════════════════════════════════════════════════════════
// test/features/favorites/domain/toggle_favorite_usecase_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/favorites/domain/entities/favorite_pokemon.dart';
import 'package:pokedex_global66/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:pokedex_global66/features/favorites/domain/usecases/toggle_favorite_usecase.dart';

class MockFavoritesRepository extends Mock implements IFavoritesRepository {}

void main() {
  late ToggleFavoriteUseCase useCase;
  late MockFavoritesRepository mockRepo;

  const tPikachu = FavoritePokemon(
    id: 25,
    name: 'pikachu',
    primaryType: 'electric',
  );

  const tBulbasaur = FavoritePokemon(
    id: 1,
    name: 'bulbasaur',
    primaryType: 'grass',
  );

  setUp(() {
    mockRepo = MockFavoritesRepository();
    useCase = ToggleFavoriteUseCase(mockRepo);

    // Default stub: saveFavorites always succeeds
    when(
      () => mockRepo.saveFavorites(any()),
    ).thenReturn(TaskEither.right(unit));
  });

  group('ToggleFavoriteUseCase — add', () {
    test('adds pokemon when not already in favorites', () async {
      final params = ToggleFavoriteParams(
        pokemon: tPikachu,
        currentFavorites: [tBulbasaur],
      );

      final result = await useCase(params).run();

      result.fold((_) => fail('Expected Right'), (updated) {
        expect(updated.length, 2);
        expect(updated.any((f) => f.id == tPikachu.id), isTrue);
      });

      verify(() => mockRepo.saveFavorites([tBulbasaur, tPikachu])).called(1);
    });
  });

  group('ToggleFavoriteUseCase — remove', () {
    test('removes pokemon when already in favorites', () async {
      final params = ToggleFavoriteParams(
        pokemon: tPikachu,
        currentFavorites: [tBulbasaur, tPikachu],
      );

      final result = await useCase(params).run();

      result.fold((_) => fail('Expected Right'), (updated) {
        expect(updated.length, 1);
        expect(updated.any((f) => f.id == tPikachu.id), isFalse);
      });
    });
  });

  group('ToggleFavoriteUseCase — storage failure', () {
    test('returns Left when repository save fails', () async {
      const tException = AppException.storage(message: 'Write failed');

      when(
        () => mockRepo.saveFavorites(any()),
      ).thenReturn(TaskEither.left(tException));

      final params = ToggleFavoriteParams(
        pokemon: tPikachu,
        currentFavorites: [],
      );

      final result = await useCase(params).run();

      expect(result, isA<Left<AppException, List<FavoritePokemon>>>());
    });
  });

  group('FavoritePokemon storage serialisation', () {
    test('round-trips through toStorageString / fromStorageString', () {
      const original = FavoritePokemon(
        id: 25,
        name: 'pikachu',
        primaryType: 'electric',
      );

      final serialised = original.toStorageString();
      final deserialised = FavoritePokemon.fromStorageString(serialised);

      expect(deserialised, equals(original));
    });

    test('formattedId pads correctly', () {
      expect(tPikachu.formattedId, '#025');
      expect(tBulbasaur.formattedId, '#001');
    });
  });
}
