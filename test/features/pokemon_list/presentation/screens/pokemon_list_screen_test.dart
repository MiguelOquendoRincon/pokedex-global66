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
import '../../../../helpers/test_utils.dart';

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

    // ignore: invalid_use_of_visible_for_overriding_member
    when(() => mockListNotifier.build()).thenReturn(const PokemonListState());
    // ignore: invalid_use_of_visible_for_overriding_member
    when(() => mockFavorites.build()).thenReturn([]);
    // ignore: invalid_use_of_visible_for_overriding_member
    when(() => mockCache.build()).thenReturn({});
  });

  Widget createWidgetUnderTest() {
    return ProviderScope(
      overrides: [
        pokemonListProvider.overrideWith(() => mockListNotifier),
        favoritesProvider.overrideWith(() => mockFavorites),
        pokemonTypeCacheProvider.overrideWith(() => mockCache),
      ],
      child: wrapWithMaterial(const PokemonListScreen()),
    );
  }

  testWidgets('shows skeleton items when loading initially', (tester) async {
    when(
      // ignore: invalid_use_of_visible_for_overriding_member
      () => mockListNotifier.build(),
    ).thenReturn(const PokemonListState(isInitialLoading: true));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(PokemonListSkeletonItem), findsWidgets);
  });

  testWidgets('displays list of pokemon when loading is complete', (
    tester,
  ) async {
    when(
      // ignore: invalid_use_of_visible_for_overriding_member
      () => mockListNotifier.build(),
    ).thenReturn(
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
    when(
      // ignore: invalid_use_of_visible_for_overriding_member
      () => mockListNotifier.build(),
    ).thenReturn(
      const PokemonListState(
        isInitialLoading: false,
        error: tException,
        previews: [],
      ),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(const Duration(milliseconds: 500));

    // The error widget should show a retry button
    expect(find.byType(FilledButton), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
  });
}
