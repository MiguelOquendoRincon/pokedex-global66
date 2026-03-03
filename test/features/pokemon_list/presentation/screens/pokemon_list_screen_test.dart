// ══════════════════════════════════════════════════════════════════════════════
// test/features/pokemon_list/presentation/screens/pokemon_list_screen_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/favorites/domain/entities/favorite_pokemon.dart';
import 'package:pokedex_global66/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_preview.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_list_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/screens/pokemon_list_screen.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_list_skeleton.dart';

class MockPokemonListNotifier extends Notifier<PokemonListState>
    with Mock
    implements PokemonListNotifier {}

class MockFavoritesNotifier extends Notifier<List<FavoritePokemon>>
    with Mock
    implements FavoritesNotifier {}

class MockPokemonTypeCache extends Notifier<Map<String, List<String>>>
    with Mock
    implements PokemonTypeCache {}

void main() {
  late MockPokemonListNotifier mockListNotifier;
  late MockFavoritesNotifier mockFavorites;
  late MockPokemonTypeCache mockCache;

  const tPokemon = PokemonPreview(
    id: 1,
    name: 'bulbasaur',
    types: ['grass'],
    imageUrl: 'https://example.com/1.png',
  );

  setUp(() {
    mockListNotifier = MockPokemonListNotifier();
    mockFavorites = MockFavoritesNotifier();
    mockCache = MockPokemonTypeCache();

    when(() => mockListNotifier.build()).thenReturn(const PokemonListState());
    when(() => mockFavorites.build()).thenReturn([]);
    when(() => mockCache.build()).thenReturn({});
  });

  Widget createWidgetUnderTest() {
    return ProviderScope(
      overrides: [
        pokemonListProvider.overrideWith(() => mockListNotifier),
        favoritesProvider.overrideWith(() => mockFavorites),
        pokemonTypeCacheProvider.overrideWith(() => mockCache),
      ],
      child: const MaterialApp(home: PokemonListScreen()),
    );
  }

  testWidgets('shows skeleton items when loading initially', (tester) async {
    when(
      () => mockListNotifier.build(),
    ).thenReturn(const PokemonListState(isInitialLoading: true));

    await tester.pumpWidget(createWidgetUnderTest());
    // Use pump with duration to settle initial microtasks but avoid infinite shimmers failing the test
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(PokemonListSkeletonItem), findsWidgets);
  });

  testWidgets('displays list of pokemon when loading is complete', (
    tester,
  ) async {
    when(() => mockListNotifier.build()).thenReturn(
      const PokemonListState(isInitialLoading: false, previews: [tPokemon]),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Bulbasaur'), findsOneWidget);
    expect(find.text('Nº001'), findsOneWidget);
  });

  testWidgets('shows error state when fetch fails on first page', (
    tester,
  ) async {
    const tException = AppException.network(message: 'Connection failed');
    when(() => mockListNotifier.build()).thenReturn(
      const PokemonListState(
        isInitialLoading: false,
        error: tException,
        previews: [],
      ),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Oops! Something went wrong'), findsOneWidget);
  });
}
