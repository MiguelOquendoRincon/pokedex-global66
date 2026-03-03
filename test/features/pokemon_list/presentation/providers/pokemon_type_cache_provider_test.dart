// ══════════════════════════════════════════════════════════════════════════════
// test/features/pokemon_list/presentation/providers/pokemon_type_cache_provider_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('PokemonTypeCache', () {
    test('initial state should be empty', () {
      final state = container.read(pokemonTypeCacheProvider);
      expect(state, isEmpty);
    });

    test('register should update the cache for a single pokemon', () {
      final notifier = container.read(pokemonTypeCacheProvider.notifier);

      notifier.register('pikachu', ['electric']);

      final state = container.read(pokemonTypeCacheProvider);
      expect(state, containsPair('pikachu', ['electric']));
    });

    test(
      'registerMany should update the cache for multiple pokemon at once',
      () {
        final notifier = container.read(pokemonTypeCacheProvider.notifier);

        final data = {
          'bulbasaur': ['grass', 'poison'],
          'charmander': ['fire'],
        };

        notifier.registerMany(data);

        final state = container.read(pokemonTypeCacheProvider);
        expect(state, containsPair('bulbasaur', ['grass', 'poison']));
        expect(state, containsPair('charmander', ['fire']));
        expect(state.length, 2);
      },
    );

    test(
      'register should overwrite existing data for the same pokemon name',
      () {
        final notifier = container.read(pokemonTypeCacheProvider.notifier);

        notifier.register('pikachu', ['electric', 'normal']);
        notifier.register('pikachu', ['electric']);

        final state = container.read(pokemonTypeCacheProvider);
        expect(state['pikachu'], ['electric']);
      },
    );
  });
}
