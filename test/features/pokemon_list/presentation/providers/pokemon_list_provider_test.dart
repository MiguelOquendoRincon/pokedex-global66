// ══════════════════════════════════════════════════════════════════════════════
// test/features/pokemon_list/presentation/providers/pokemon_list_provider_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_preview.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/usecases/get_pokemon_page_usecase.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_list_provider.dart';

class MockGetPokemonPageUseCase extends Mock implements GetPokemonPageUseCase {}

void main() {
  late MockGetPokemonPageUseCase mockUseCase;
  late ProviderContainer container;

  const tPreview = PokemonPreview(
    id: 1,
    name: 'bulbasaur',
    types: ['grass'],
    imageUrl: 'https://example.com/1.png',
  );

  const tNewPreview = PokemonPreview(
    id: 2,
    name: 'ivysaur',
    types: ['grass'],
    imageUrl: 'https://example.com/2.png',
  );

  setUp(() {
    mockUseCase = MockGetPokemonPageUseCase();
    container = ProviderContainer(
      overrides: [getPokemonPageUseCaseProvider.overrideWithValue(mockUseCase)],
    );

    // Default stub — successful page fetch
    when(
      () => mockUseCase(
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    ).thenReturn(TaskEither.right([tPreview]));
  });

  tearDown(() {
    container.dispose();
  });

  group('PokemonListNotifier', () {
    test(
      'initial state handles loading and then first page successfully',
      () async {
        // Act
        // Reading triggers build(), which starts a microtask for initial fetch
        final state = container.read(pokemonListProvider);

        // Assert (immediate)
        expect(state.isInitialLoading, isTrue);
        expect(state.previews, isEmpty);

        // Wait for it to complete
        await pumpEventQueue();

        // Assert (after microtask)
        final finalState = container.read(pokemonListProvider);
        expect(finalState.isInitialLoading, isFalse);
        expect(finalState.previews, hasLength(1));
        expect(finalState.previews.first, equals(tPreview));
        verify(
          () => mockUseCase(limit: any(named: 'limit'), offset: 0),
        ).called(1);
      },
    );

    test('fetchMore adds more previews to the list', () async {
      // Arrange (start with data already loaded, ensuring NOT at end of list)
      when(
        () => mockUseCase(limit: any(named: 'limit'), offset: 0),
      ).thenReturn(TaskEither.right(List.generate(10, (_) => tPreview)));
      when(
        () => mockUseCase(limit: any(named: 'limit'), offset: 10),
      ).thenReturn(TaskEither.right([tNewPreview]));

      // Act
      container.read(pokemonListProvider); // First page
      await pumpEventQueue();

      expect(container.read(pokemonListProvider).previews, hasLength(10));
      expect(container.read(pokemonListProvider).hasReachedEnd, isFalse);

      container.read(pokemonListProvider.notifier).fetchMore(); // Second page

      // Assert (immediate during pagination)
      expect(container.read(pokemonListProvider).isLoadingMore, isTrue);

      await pumpEventQueue();

      // Assert (final)
      final state = container.read(pokemonListProvider);
      expect(state.isLoadingMore, isFalse);
      expect(state.previews, hasLength(11));
      expect(state.previews.last, equals(tNewPreview));
    });

    test('retry clears error and tries reloading the first page', () async {
      // Arrange
      const tException = AppException.network(message: 'Error');
      when(
        () => mockUseCase(limit: any(named: 'limit'), offset: 0),
      ).thenReturn(TaskEither.left(tException));

      // Act (initial load fails)
      container.read(pokemonListProvider);
      await pumpEventQueue();
      expect(container.read(pokemonListProvider).error, isNotNull);

      // Re-stub success
      when(
        () => mockUseCase(limit: any(named: 'limit'), offset: 0),
      ).thenReturn(TaskEither.right([tPreview]));

      // Act - retry
      container.read(pokemonListProvider.notifier).retry();
      expect(container.read(pokemonListProvider).isInitialLoading, isTrue);
      expect(container.read(pokemonListProvider).error, isNull);

      await pumpEventQueue();

      // Assert
      expect(container.read(pokemonListProvider).previews, hasLength(1));
    });

    test('updateSearch trims and updates the search query', () {
      final notifier = container.read(pokemonListProvider.notifier);
      notifier.updateSearch(' pikachu ');
      expect(container.read(pokemonListProvider).searchQuery, 'pikachu');
    });

    test('clearFilters resets text and selections', () {
      final notifier = container.read(pokemonListProvider.notifier);
      notifier.updateSearch('pika');
      notifier.updateTypeFilter('grass');
      notifier.updateTypeFilters({'electric'});

      expect(container.read(pokemonListProvider).hasActiveFilters, isTrue);

      notifier.clearFilters();

      final state = container.read(pokemonListProvider);
      expect(state.searchQuery, isEmpty);
      expect(state.selectedType, isEmpty);
      expect(state.selectedTypes, isEmpty);
      expect(state.hasActiveFilters, isFalse);
    });
  });
}
