// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_detail/domain/usecases/get_pokemon_detail_usecase.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/pokemon_details.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/repositories/pokemon_details_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/pokemon_detail_repository_impl.dart';

part 'get_pokemon_detail_usecase.g.dart';

class GetPokemonDetailUseCase implements UseCase<PokemonDetail, String> {
  const GetPokemonDetailUseCase(this._repository);
  final IPokemonDetailRepository _repository;

  @override
  TaskEither<AppException, PokemonDetail> call(String name) =>
      _repository.getPokemonDetail(name);
}

@riverpod
GetPokemonDetailUseCase getPokemonDetailUseCase(Ref ref) =>
    GetPokemonDetailUseCase(ref.read(pokemonDetailRepositoryProvider));
