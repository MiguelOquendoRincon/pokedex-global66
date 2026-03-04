import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/l10n/locale_provider.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/datasource/pokemon_detail_remote_datasource.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/models/pokemon_detail_model.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/providers/ability_translation_provider.dart';

class MockPokemonDetailRemoteDatasource extends Mock
    implements IPokemonDetailRemoteDatasource {}

void main() {
  late MockPokemonDetailRemoteDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockPokemonDetailRemoteDatasource();
  });

  ProviderContainer createContainer({List overrides = const []}) {
    final container = ProviderContainer(
      overrides: [
        pokemonDetailRemoteDatasourceProvider.overrideWithValue(mockDatasource),
        ...overrides,
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('returns Spanish name when available and locale is "es"', () async {
    const abilityName = 'overgrow';
    const spanishName = 'Espesura';

    final abilityModel = AbilityDetailsModel(
      id: 1,
      name: abilityName,
      names: [
        const AbilityNameModel(
          name: 'Overgrow',
          language: NamedAPIResourceModel(name: 'en', url: ''),
        ),
        const AbilityNameModel(
          name: spanishName,
          language: NamedAPIResourceModel(name: 'es', url: ''),
        ),
      ],
    );

    when(() => mockDatasource.fetchAbilityDetails(abilityName)).thenReturn(
      TaskEither<AppException, AbilityDetailsModel>.right(abilityModel),
    );

    final container = createContainer(
      overrides: [localeProvider.overrideWithValue(const Locale('es'))],
    );

    final result = await container.read(
      abilityTranslationProvider(abilityName).future,
    );

    expect(result, spanishName);
    verify(() => mockDatasource.fetchAbilityDetails(abilityName)).called(1);
  });

  test('caches the result and does not call datasource twice', () async {
    const abilityName = 'overgrow';
    final abilityModel = AbilityDetailsModel(
      id: 1,
      name: abilityName,
      names: [
        const AbilityNameModel(
          name: 'Overgrow',
          language: NamedAPIResourceModel(name: 'en', url: ''),
        ),
      ],
    );

    when(() => mockDatasource.fetchAbilityDetails(abilityName)).thenReturn(
      TaskEither<AppException, AbilityDetailsModel>.right(abilityModel),
    );

    final container = createContainer();

    // Call 1
    await container.read(abilityTranslationProvider(abilityName).future);
    // Call 2
    await container.read(abilityTranslationProvider(abilityName).future);

    verify(() => mockDatasource.fetchAbilityDetails(abilityName)).called(1);
  });

  test('falls back to raw name on error', () async {
    const abilityName = 'overgrow';

    when(() => mockDatasource.fetchAbilityDetails(abilityName)).thenReturn(
      TaskEither<AppException, AbilityDetailsModel>.left(
        const AppException.unknown(message: 'error'),
      ),
    );

    final container = createContainer();

    final result = await container.read(
      abilityTranslationProvider(abilityName).future,
    );

    expect(result, abilityName);
  });
}
