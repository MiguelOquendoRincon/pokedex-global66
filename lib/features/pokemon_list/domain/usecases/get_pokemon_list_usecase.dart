// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_list/domain/usecases/get_pokemon_list_usecase.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/network/api_constants.dart';
import 'package:pokedex_global66/core/usecase/usecase.dart';
import 'package:pokedex_global66/features/pokemon_list/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/repositories/i_pokemon_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pokemon_list_usecase.freezed.dart';
part 'get_pokemon_list_usecase.g.dart';

/// Parameters for fetching a list of Pokémon.
@freezed
abstract class GetPokemonListParams with _$GetPokemonListParams {
  const factory GetPokemonListParams({
    @Default(ApiConstants.defaultPageLimit) int limit,
    @Default(0) int offset,
  }) = _GetPokemonListParams;
}

/// A use case that retrieves a paginated list of [PokemonSummary].
class GetPokemonListUseCase
    implements UseCase<List<PokemonSummary>, GetPokemonListParams> {
  const GetPokemonListUseCase(this._repository);
  final IPokemonRepository _repository;

  @override
  TaskEither<AppException, List<PokemonSummary>> call(
    GetPokemonListParams params,
  ) => _repository.getPokemonList(limit: params.limit, offset: params.offset);
}

/// A provider that exposes an instance of [GetPokemonListUseCase].
@riverpod
GetPokemonListUseCase getPokemonListUseCase(Ref ref) =>
    GetPokemonListUseCase(ref.read(pokemonRepositoryProvider));
