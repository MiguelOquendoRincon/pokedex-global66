// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_detail/domain/usecases/get_pokemon_detail_usecase.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/entities/pokemon_details.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/repositories/pokemon_details_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/pokemon_detail_repository_impl.dart';

part 'get_pokemon_detail_usecase.g.dart';

/// Parameters for fetching the details of a specific Pokémon.
class GetPokemonDetailParams {
  const GetPokemonDetailParams({required this.name, required this.language});

  /// The name of the Pokémon (identifier in the API).
  final String name;

  /// The BCP 47 language code for translated content (e.g., 'es', 'en').
  final String language;
}

/// A use case that retrieves complete details for a specific Pokémon.
class GetPokemonDetailUseCase
    implements UseCase<PokemonDetail, GetPokemonDetailParams> {
  const GetPokemonDetailUseCase(this._repository);
  final IPokemonDetailRepository _repository;

  @override
  /// Fetches [PokemonDetail] from the repository using name and language.
  TaskEither<AppException, PokemonDetail> call(GetPokemonDetailParams params) =>
      _repository.getPokemonDetail(params.name, params.language);
}

/// A provider that exposes an instance of [GetPokemonDetailUseCase].
@Riverpod(keepAlive: true)
GetPokemonDetailUseCase getPokemonDetailUseCase(Ref ref) =>
    GetPokemonDetailUseCase(ref.read(pokemonDetailRepositoryProvider));
