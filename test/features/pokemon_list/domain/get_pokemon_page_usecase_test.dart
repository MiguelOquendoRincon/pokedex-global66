// ══════════════════════════════════════════════════════════════════════════════
// test/features/pokemon_list/domain/get_pokemon_page_usecase_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/repositories/pokemon_detail_repository_impl.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/entities/pokemon_details.dart';
import 'package:pokedex_global66/features/pokemon_list/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/usecases/get_pokemon_page_usecase.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';

class MockPokemonRepository extends Mock implements PokemonRepositoryImpl {}

class MockPokemonDetailRepository extends Mock
    implements PokemonDetailRepositoryImpl {}

void main() {
  late GetPokemonPageUseCase useCase;
  late MockPokemonRepository mockListRepo;
  late MockPokemonDetailRepository mockDetailRepo;
  late ProviderContainer container;

  setUp(() {
    mockListRepo = MockPokemonRepository();
    mockDetailRepo = MockPokemonDetailRepository();

    container = ProviderContainer(
      overrides: [
        pokemonRepositoryProvider.overrideWithValue(mockListRepo),
        pokemonDetailRepositoryProvider.overrideWithValue(mockDetailRepo),
      ],
    );

    useCase = container.read(getPokemonPageUseCaseProvider);
  });

  tearDown(() {
    container.dispose();
  });

  final tSummaries = [
    const PokemonSummary(id: 1, name: 'bulbasaur'),
    const PokemonSummary(id: 4, name: 'charmander'),
  ];

  final tDetailBulbasaur = PokemonDetail(
    id: 1,
    name: 'bulbasaur',
    height: 7,
    weight: 69,
    baseExperience: 64,
    types: ['grass', 'poison'],
    stats: {},
    abilities: [],
    weaknesses: [],
    description: '',
    category: '',
    genderRate: 1,
  );

  final tDetailCharmander = PokemonDetail(
    id: 4,
    name: 'charmander',
    height: 6,
    weight: 85,
    baseExperience: 62,
    types: ['fire'],
    stats: {},
    abilities: [],
    weaknesses: [],
    description: '',
    category: '',
    genderRate: 1,
  );

  group('GetPokemonPageUseCase', () {
    test(
      'returns initial previews and triggers background enrichment',
      () async {
        // Arrange
        when(
          () => mockListRepo.getPokemonList(limit: 2, offset: 0),
        ).thenReturn(TaskEither.right(tSummaries));

        when(
          () => mockDetailRepo.getPokemonDetail(any(), any()),
        ).thenReturn(TaskEither.right(tDetailBulbasaur));

        // Act
        final result = await useCase(limit: 2, offset: 0).run();

        // Assert
        expect(result.isRight(), true);
        final previews = result.getOrElse((_) => []);
        expect(previews.length, 2);
        expect(previews[0].name, 'bulbasaur');
        expect(previews[0].types, isEmpty);

        // Wait for background tasks to finish
        await Future.delayed(const Duration(milliseconds: 100));

        verify(
          () => mockDetailRepo.getPokemonDetail('bulbasaur', any()),
        ).called(1);
        verify(
          () => mockDetailRepo.getPokemonDetail('charmander', any()),
        ).called(1);

        final cache = container.read(pokemonTypeCacheProvider);
        expect(cache['bulbasaur'], ['grass', 'poison']);
      },
    );

    test('returns Left when list repository fails', () async {
      // Arrange
      final tException = AppException.network(message: 'Failed');
      when(
        () => mockListRepo.getPokemonList(limit: 2, offset: 0),
      ).thenReturn(TaskEither.left(tException));

      // Act
      final result = await useCase(limit: 2, offset: 0).run();

      // Assert
      expect(result.isLeft(), true);
      verifyNever(() => mockDetailRepo.getPokemonDetail(any(), any()));
    });

    test('ignores failures in individual detail calls', () async {
      // Arrange
      when(
        () => mockListRepo.getPokemonList(limit: 2, offset: 0),
      ).thenReturn(TaskEither.right(tSummaries));

      when(
        () => mockDetailRepo.getPokemonDetail('bulbasaur', any()),
      ).thenReturn(
        TaskEither<AppException, PokemonDetail>.left(
          AppException.unknown(message: 'Error'),
        ),
      );
      when(
        () => mockDetailRepo.getPokemonDetail('charmander', any()),
      ).thenReturn(TaskEither.right(tDetailCharmander));

      // Act
      final result = await useCase(limit: 2, offset: 0).run();

      // Assert
      expect(result.isRight(), true);

      await Future.delayed(const Duration(milliseconds: 100));

      final cache = container.read(pokemonTypeCacheProvider);
      expect(cache.containsKey('bulbasaur'), false);
      expect(cache['charmander'], ['fire']);
    });

    test('skips enrichment if already in cache', () async {
      // Arrange
      container.read(pokemonTypeCacheProvider.notifier).register('bulbasaur', [
        'grass',
      ]);

      when(
        () => mockListRepo.getPokemonList(limit: 2, offset: 0),
      ).thenReturn(TaskEither.right(tSummaries));

      when(
        () => mockDetailRepo.getPokemonDetail('charmander', any()),
      ).thenReturn(TaskEither.right(tDetailCharmander));

      // Act
      await useCase(limit: 2, offset: 0).run();
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      verifyNever(() => mockDetailRepo.getPokemonDetail('bulbasaur', any()));
      verify(
        () => mockDetailRepo.getPokemonDetail('charmander', any()),
      ).called(1);
    });
  });
}
