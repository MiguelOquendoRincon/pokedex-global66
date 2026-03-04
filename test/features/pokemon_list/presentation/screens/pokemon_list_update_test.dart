import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/features/favorites/domain/entities/favorite_pokemon.dart';
import 'package:pokedex_global66/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_preview.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_list_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/screens/pokemon_list_screen.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_card.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/pokemon_type_chip.dart';
import '../../../../helpers/test_utils.dart';

class MockPokemonListNotifier extends Notifier<PokemonListState>
    with Mock
    implements PokemonListNotifier {}

class MockFavoritesNotifier extends Notifier<List<FavoritePokemon>>
    with Mock
    implements FavoritesNotifier {}

class PokemonTypeCacheReal extends PokemonTypeCache {
  @override
  Map<String, List<String>> build() => {};
}

void main() {
  late MockPokemonListNotifier mockListNotifier;
  late MockFavoritesNotifier mockFavorites;
  late PokemonTypeCacheReal realCache;

  final tPreviews = List.generate(
    10,
    (i) => PokemonPreview(
      id: i + 1,
      name: 'pokemon_$i',
      types: const [], // Empty initially
      imageUrl: 'https://example.com/$i.png',
    ),
  );

  setUp(() {
    mockListNotifier = MockPokemonListNotifier();
    mockFavorites = MockFavoritesNotifier();
    realCache = PokemonTypeCacheReal();

    // ignore: invalid_use_of_visible_for_overriding_member
    when(
      // ignore: invalid_use_of_visible_for_overriding_member
      () => mockListNotifier.build(),
    ).thenReturn(PokemonListState(previews: tPreviews));
    // ignore: invalid_use_of_visible_for_overriding_member
    when(() => mockFavorites.build()).thenReturn([]);
  });

  tearDown(() {});

  testWidgets('Pokemon cards update when type cache is updated', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;

    addTearDown(() => tester.view.resetPhysicalSize());

    final container = ProviderContainer(
      overrides: [
        pokemonListProvider.overrideWith(() => mockListNotifier),
        favoritesProvider.overrideWith(() => mockFavorites),
        pokemonTypeCacheProvider.overrideWith(() => realCache),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: wrapWithMaterial(const PokemonListScreen()),
      ),
    );

    // 1. Initially, no TypeChips should be found (they show placeholders)
    expect(find.byType(PokemonCard), findsWidgets);
    expect(find.byType(PokemonTypeChip), findsNothing);

    // 2. Update cache for the first 7 pokemon
    final notifier = container.read(pokemonTypeCacheProvider.notifier);
    for (int i = 0; i < 7; i++) {
      notifier.register('pokemon_$i', ['fire']);
    }

    // 3. Pump to trigger rebuilds
    await tester.pumpAndSettle();

    // 4. Now we expect 7 pokemon cards to have chips (they have been enriched)
    expect(find.byType(PokemonTypeChip), findsNWidgets(7));
  });
}
