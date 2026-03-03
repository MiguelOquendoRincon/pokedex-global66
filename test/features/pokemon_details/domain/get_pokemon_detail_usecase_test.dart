// ══════════════════════════════════════════════════════════════════════════════
// test/features/pokemon_detail/domain/get_pokemon_detail_usecase_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/entities/pokemon_details.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/repositories/pokemon_details_repository.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/usecases/get_pokemon_detail_usecase.dart';

class MockPokemonDetailRepository extends Mock
    implements IPokemonDetailRepository {}

void main() {
  late GetPokemonDetailUseCase useCase;
  late MockPokemonDetailRepository mockRepo;

  const tDetail = PokemonDetail(
    id: 25,
    name: 'pikachu',
    height: 4,
    weight: 60,
    baseExperience: 112,
    types: ['electric'],
    stats: {'hp': 35, 'attack': 55, 'defense': 40, 'speed': 90},
    abilities: ['static'],
    weaknesses: ['ground'],
    description: 'When it posits its tail, it is very cute.',
    category: 'Mouse',
    genderRate: 4,
    imageUrl: 'https://example.com/pikachu.png',
  );

  setUp(() {
    mockRepo = MockPokemonDetailRepository();
    useCase = GetPokemonDetailUseCase(mockRepo);
  });

  group('GetPokemonDetailUseCase', () {
    test('returns Right(PokemonDetail) on success', () async {
      when(
        () => mockRepo.getPokemonDetail('pikachu', 'en'),
      ).thenReturn(TaskEither.right(tDetail));

      final result = await useCase(
        const GetPokemonDetailParams(name: 'pikachu', language: 'en'),
      ).run();

      result.fold((_) => fail('Expected Right'), (detail) {
        expect(detail.id, 25);
        expect(detail.heightFormatted, '0.4 m');
        expect(detail.weightFormatted, '6.0 kg');
        expect(detail.primaryType, 'electric');
        expect(detail.statValue('hp'), 35);
      });
    });

    test('returns Left(NotFoundException) when not found', () async {
      when(
        () => mockRepo.getPokemonDetail('missingno', 'en'),
      ).thenReturn(TaskEither.left(const AppException.notFound()));

      final result = await useCase(
        const GetPokemonDetailParams(name: 'missingno', language: 'en'),
      ).run();

      expect(result, isA<Left<AppException, PokemonDetail>>());
      result.fold(
        (e) => expect(e, isA<NotFoundException>()),
        (_) => fail('Expected Left'),
      );
    });
  });
}
