// ══════════════════════════════════════════════════════════════════════════════
// test/features/pokemon_details/data/repositories/pokemon_detail_repository_impl_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/datasource/pokemon_detail_remote_datasource.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/models/pokemon_detail_model.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/repositories/pokemon_detail_repository_impl.dart';

class MockPokemonDetailRemoteDatasource extends Mock
    implements IPokemonDetailRemoteDatasource {}

void main() {
  late PokemonDetailRepositoryImpl repository;
  late MockPokemonDetailRemoteDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockPokemonDetailRemoteDatasource();
    repository = PokemonDetailRepositoryImpl(mockDatasource);
  });

  const tName = 'pikachu';
  const tLanguage = 'en';

  const tDetailModel = PokemonDetailModel(
    id: 25,
    name: 'pikachu',
    baseExperience: 112,
    height: 4,
    weight: 60,
    types: [
      PokemonTypeSlotModel(
        slot: 1,
        type: PokemonTypeModel(name: 'electric', url: ''),
      ),
    ],
    stats: [
      PokemonStatModel(
        baseStat: 35,
        effort: 0,
        stat: PokemonStatInfoModel(name: 'hp', url: ''),
      ),
    ],
    abilities: [
      PokemonAbilitySlotModel(
        isHidden: false,
        slot: 1,
        ability: PokemonAbilityInfoModel(name: 'static', url: ''),
      ),
    ],
    sprites: PokemonSpritesModel(
      frontDefault: 'front_url',
      other: PokemonOtherSpritesModel(
        officialArtwork: PokemonOfficialArtworkModel(
          frontDefault: 'official_url',
        ),
      ),
    ),
  );

  const tSpeciesModel = PokemonSpeciesModel(
    genderRate: 4,
    flavorTextEntries: [
      FlavorTextEntryModel(
        flavorText: 'Pikachu flavor text',
        language: NamedAPIResourceModel(name: 'en', url: ''),
        version: NamedAPIResourceModel(name: 'red', url: ''),
      ),
    ],
    genera: [
      GenusModel(
        genus: 'Mouse Pokémon',
        language: NamedAPIResourceModel(name: 'en', url: ''),
      ),
    ],
  );

  const tTypeDetailsModel = PokemonTypeDetailsModel(
    name: 'electric',
    damageRelations: TypeDamageRelationsModel(
      doubleDamageFrom: [NamedAPIResourceModel(name: 'ground', url: '')],
      halfDamageFrom: [NamedAPIResourceModel(name: 'flying', url: '')],
      noDamageFrom: [],
    ),
  );

  group('PokemonDetailRepositoryImpl', () {
    test(
      'successfully fetches and aggregates pokemon data into entity',
      () async {
        // Arrange
        when(
          () => mockDatasource.fetchPokemonDetail(tName, language: tLanguage),
        ).thenReturn(TaskEither.right(tDetailModel));
        when(
          () => mockDatasource.fetchPokemonSpecies(25, language: tLanguage),
        ).thenReturn(TaskEither.right(tSpeciesModel));
        when(
          () =>
              mockDatasource.fetchTypeDetails('electric', language: tLanguage),
        ).thenReturn(TaskEither.right(tTypeDetailsModel));

        // Act
        final result = await repository
            .getPokemonDetail(tName, tLanguage)
            .run();

        // Assert
        expect(result.isRight(), isTrue);
        result.fold((l) => fail('Should be right'), (r) {
          expect(r.id, 25);
          expect(r.name, 'pikachu');
          expect(r.weaknesses, contains('ground'));
          expect(r.description, 'Pikachu flavor text');
          expect(r.category, 'Mouse Pokémon');
          expect(r.imageUrl, 'official_url');
        });
      },
    );

    test('returns Left when fetchPokemonDetail fails', () async {
      // Arrange
      when(
        () => mockDatasource.fetchPokemonDetail(tName, language: tLanguage),
      ).thenReturn(
        TaskEither.left(const AppException.network(message: 'Error')),
      );

      // Act
      final result = await repository.getPokemonDetail(tName, tLanguage).run();

      // Assert
      expect(result.isLeft(), isTrue);
    });

    test('returns Left when fetchTypeDetails fails', () async {
      // Arrange
      when(
        () => mockDatasource.fetchPokemonDetail(tName, language: tLanguage),
      ).thenReturn(TaskEither.right(tDetailModel));
      when(
        () => mockDatasource.fetchPokemonSpecies(25, language: tLanguage),
      ).thenReturn(TaskEither.right(tSpeciesModel));
      when(
        () => mockDatasource.fetchTypeDetails(
          any(),
          language: any(named: 'language'),
        ),
      ).thenReturn(
        TaskEither.left(const AppException.network(message: 'Error')),
      );

      // Act
      final result = await repository.getPokemonDetail(tName, tLanguage).run();

      // Assert
      expect(result.isLeft(), isTrue);
    });
  });
}
