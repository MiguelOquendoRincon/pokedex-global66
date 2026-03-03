// ══════════════════════════════════════════════════════════════════════════════
// test/features/pokemon_list/presentation/widgets/pokemon_card_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_preview.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_card.dart';
import 'package:pokedex_global66/features/favorites/domain/entities/favorite_pokemon.dart';
import '../../../../helpers/test_utils.dart';

class MockFavoritesNotifier extends Notifier<List<FavoritePokemon>>
    with Mock
    implements FavoritesNotifier {}

class MockPokemonTypeCache extends Notifier<Map<String, List<String>>>
    with Mock
    implements PokemonTypeCache {}

void main() {
  late MockFavoritesNotifier mockFavorites;
  late MockPokemonTypeCache mockCache;

  const tPokemon = PokemonPreview(
    id: 25,
    name: 'pikachu',
    types: ['electric'],
    imageUrl: 'https://example.com/25.png',
  );

  setUp(() {
    mockFavorites = MockFavoritesNotifier();
    mockCache = MockPokemonTypeCache();

    when(() => mockFavorites.build()).thenReturn([]);
    when(() => mockCache.build()).thenReturn({});
  });

  Widget createWidgetUnderTest() {
    return ProviderScope(
      overrides: [
        favoritesProvider.overrideWith(() => mockFavorites),
        pokemonTypeCacheProvider.overrideWith(() => mockCache),
      ],
      child: wrapWithMaterial(
        Scaffold(
          body: Center(
            child: SizedBox(
              width: 375,
              child: PokemonCard(pokemon: tPokemon, types: const ['electric']),
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('renders all pokemon details correctly', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Nº025'), findsOneWidget);
    expect(find.text('Pikachu'), findsOneWidget);
    expect(find.text('Electric'), findsOneWidget);
  });

  testWidgets('shows filled favorite icon when pokemon is in favorites list', (
    tester,
  ) async {
    final tFavorite = FavoritePokemon(
      id: 25,
      name: 'pikachu',
      primaryType: 'electric',
    );
    when(() => mockFavorites.build()).thenReturn([tFavorite]);

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets('calls toggleFromList when favorite button is tapped', (
    tester,
  ) async {
    when(() => mockFavorites.build()).thenReturn([]);
    when(
      () => mockFavorites.toggleFromList(
        id: 25,
        name: 'pikachu',
        primaryType: any(named: 'primaryType'),
      ),
    ).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(const Duration(milliseconds: 500));

    final favoriteButton = find.byType(GestureDetector).last;
    await tester.tap(favoriteButton);
    // Allow animation to run and test to end without pending timers
    await tester.pump(const Duration(milliseconds: 500));

    verify(
      () => mockFavorites.toggleFromList(
        id: 25,
        name: 'pikachu',
        primaryType: any(named: 'primaryType'),
      ),
    ).called(1);
  });
}
