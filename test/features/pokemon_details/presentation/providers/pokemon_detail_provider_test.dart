// ══════════════════════════════════════════════════════════════════════════════
// test/features/pokemon_details/presentation/providers/pokemon_detail_provider_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/entities/pokemon_details.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/providers/pokemon_detail_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';
import 'package:pokedex_global66/core/l10n/locale_provider.dart';
import 'package:flutter/material.dart';

class MockGetPokemonDetailUseCase extends Mock
    implements GetPokemonDetailUseCase {}

// We need a real but controlled Notifier for the cache
class FakePokemonTypeCache extends PokemonTypeCache {
  @override
  Map<String, List<String>> build() => {};
}

void main() {
  late MockGetPokemonDetailUseCase mockUseCase;
  late ProviderContainer container;

  const tName = 'pikachu';

  const tDetail = PokemonDetail(
    id: 25,
    name: 'pikachu',
    height: 4,
    weight: 60,
    baseExperience: 112,
    types: ['electric'],
    stats: {'hp': 35},
    abilities: ['static'],
    weaknesses: ['ground'],
    description: 'Pikachu flavor text',
    category: 'Mouse Pokémon',
    genderRate: 4,
    imageUrl: 'official_url',
  );

  setUp(() {
    mockUseCase = MockGetPokemonDetailUseCase();

    container = ProviderContainer(
      overrides: [
        getPokemonDetailUseCaseProvider.overrideWithValue(mockUseCase),
        // Use overrideWithValue for simple state providers
        localeProvider.overrideWithValue(const Locale('en')),
        pokemonTypeCacheProvider.overrideWith(() => FakePokemonTypeCache()),
      ],
    );

    registerFallbackValue(const GetPokemonDetailParams(name: '', language: ''));
  });

  tearDown(() {
    container.dispose();
  });

  group('PokemonDetailNotifier', () {
    test('initial state handles loading and then success', () async {
      // Arrange
      when(() => mockUseCase.call(any())).thenReturn(TaskEither.right(tDetail));

      // Act
      // We MUST listen to the provider so it doesn't auto-dispose
      // before the microtask finishes.
      final subscription = container.listen(
        pokemonDetailProvider(tName),
        (prev, next) {},
      );
      final state = subscription.read();

      // Assert (initial state)
      expect(state.isLoading, isTrue);
      expect(state.detail, isNull);

      // Wait for the Future.microtask in the build() method
      await pumpEventQueue();

      // Assert (after async load)
      final finalState = subscription.read();
      expect(finalState.isLoading, isFalse);
      expect(finalState.detail, equals(tDetail));

      subscription.close();
    });

    test('handles failure from UseCase', () async {
      // Arrange
      const tException = AppException.network(message: 'Error');
      when(
        () => mockUseCase.call(any()),
      ).thenReturn(TaskEither.left(tException));

      // Act
      final subscription = container.listen(
        pokemonDetailProvider(tName),
        (prev, next) {},
      );

      await pumpEventQueue();

      // Assert
      final finalState = subscription.read();
      expect(finalState.isLoading, isFalse);
      expect(finalState.error, equals(tException));

      subscription.close();
    });

    test('retries the loading procedure when retry() is called', () async {
      // Arrange
      when(() => mockUseCase.call(any())).thenReturn(
        TaskEither.left(const AppException.network(message: 'Error')),
      );

      // Act - initial load fails
      final subscription = container.listen(
        pokemonDetailProvider(tName),
        (prev, next) {},
      );
      await pumpEventQueue();
      expect(subscription.read().error, isNotNull);

      // Re-arrange for success
      when(() => mockUseCase.call(any())).thenReturn(TaskEither.right(tDetail));

      // Act - retry
      container.read(pokemonDetailProvider(tName).notifier).retry();
      await pumpEventQueue();

      // Assert
      expect(subscription.read().detail, equals(tDetail));

      subscription.close();
    });
  });
}
