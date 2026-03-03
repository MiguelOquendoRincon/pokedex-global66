// ══════════════════════════════════════════════════════════════════════════════
// test/features/pokemon_list/data/repositories/pokemon_repository_impl_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_list/data/datasource/pokemon_list_remote_datasource.dart';
import 'package:pokedex_global66/features/pokemon_list/data/models/pokemon_item_model.dart';
import 'package:pokedex_global66/features/pokemon_list/data/models/pokemon_list_response_model.dart';
import 'package:pokedex_global66/features/pokemon_list/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';

class MockPokemonListRemoteDatasource extends Mock
    implements IPokemonListRemoteDatasource {}

void main() {
  late PokemonRepositoryImpl repository;
  late MockPokemonListRemoteDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockPokemonListRemoteDatasource();
    repository = PokemonRepositoryImpl(mockDatasource);
  });

  const tLimit = 20;
  const tOffset = 0;

  const tPokemonItem = PokemonItemModel(
    name: 'bulbasaur',
    url: 'https://pokeapi.co/api/v2/pokemon/1/',
  );

  const tResponse = PokemonListResponseModel(results: [tPokemonItem], count: 1);

  const tSummary = PokemonSummary(name: 'bulbasaur', id: 1);

  group('PokemonRepositoryImpl', () {
    test('successfully fetches and maps pokemon list to entities', () async {
      // Arrange
      when(
        () => mockDatasource.fetchPokemonList(limit: tLimit, offset: tOffset),
      ).thenReturn(TaskEither.right(tResponse));

      // Act
      final result = await repository
          .getPokemonList(limit: tLimit, offset: tOffset)
          .run();

      // Assert
      expect(result, isA<Right<AppException, List<PokemonSummary>>>());
      result.fold((l) => fail('Should be right'), (r) {
        expect(r, hasLength(1));
        expect(r.first, equals(tSummary));
      });
      verify(
        () => mockDatasource.fetchPokemonList(limit: tLimit, offset: tOffset),
      ).called(1);
    });

    test('correctly extracts ID from various URL formats', () async {
      // This test reaches into the internal mapping logic
      // through the public getPokemonList call.

      const tItemWithTrailingSlash = PokemonItemModel(
        name: 'pikachu',
        url: 'https://pokeapi.co/api/v2/pokemon/25/',
      );
      const tItemWithoutTrailingSlash = PokemonItemModel(
        name: 'meowth',
        url: 'https://pokeapi.co/api/v2/pokemon/52',
      );

      when(
        () => mockDatasource.fetchPokemonList(
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).thenReturn(
        TaskEither.right(
          const PokemonListResponseModel(
            results: [tItemWithTrailingSlash, tItemWithoutTrailingSlash],
            count: 2,
          ),
        ),
      );

      final result = await repository.getPokemonList(limit: 2, offset: 0).run();

      result.fold((l) => fail('Should be right'), (r) {
        expect(r[0].id, 25);
        expect(r[1].id, 52);
      });
    });

    test('returns Left when datasource fails', () async {
      // Arrange
      const tException = AppException.network(message: 'No internet');
      when(
        () => mockDatasource.fetchPokemonList(limit: tLimit, offset: tOffset),
      ).thenReturn(TaskEither.left(tException));

      // Act
      final result = await repository
          .getPokemonList(limit: tLimit, offset: tOffset)
          .run();

      // Assert
      expect(result, Left(tException));
    });
  });
}
