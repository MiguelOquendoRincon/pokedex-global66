// ══════════════════════════════════════════════════════════════════════════════
// test/features/pokemon_list/domain/get_pokemon_list_usecase_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/repositories/i_pokemon_repository.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/usecases/get_pokemon_list_usecase.dart';

class MockPokemonRepository extends Mock implements IPokemonRepository {}

void main() {
  late GetPokemonListUseCase useCase;
  late MockPokemonRepository mockRepo;

  setUp(() {
    mockRepo = MockPokemonRepository();
    useCase = GetPokemonListUseCase(mockRepo);
  });

  const tParams = GetPokemonListParams(limit: 20, offset: 0);

  final tSummaries = [
    const PokemonSummary(id: 1, name: 'bulbasaur'),
    const PokemonSummary(id: 25, name: 'pikachu'),
  ];

  group('GetPokemonListUseCase', () {
    test('returns Right(list) when repository succeeds', () async {
      when(
        () => mockRepo.getPokemonList(limit: 20, offset: 0),
      ).thenReturn(TaskEither.right(tSummaries));

      final result = await useCase(tParams).run();

      expect(result, isA<Right<AppException, List<PokemonSummary>>>());
      result.fold((_) => fail('Expected Right'), (list) {
        expect(list.length, 2);
        expect(list.first.name, 'bulbasaur');
        expect(list.first.formattedId, '#001');
        expect(list.last.formattedId, '#025');
      });
    });

    test('returns Left(NetworkException) when repository fails', () async {
      const tException = AppException.network(message: 'No connection');

      when(
        () => mockRepo.getPokemonList(limit: 20, offset: 0),
      ).thenReturn(TaskEither.left(tException));

      final result = await useCase(tParams).run();

      expect(result, isA<Left<AppException, List<PokemonSummary>>>());
      result.fold(
        (e) => expect(e, isA<NetworkException>()),
        (_) => fail('Expected Left'),
      );
    });

    test('delegates exact params to repository', () async {
      const customParams = GetPokemonListParams(limit: 10, offset: 40);

      when(
        () => mockRepo.getPokemonList(limit: 10, offset: 40),
      ).thenReturn(TaskEither.right([]));

      await useCase(customParams).run();

      verify(() => mockRepo.getPokemonList(limit: 10, offset: 40)).called(1);
    });
  });
}
