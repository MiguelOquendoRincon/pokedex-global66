// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_detail/data/repositories/pokemon_detail_repository_impl.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/datasource/pokemon_detail_remote_datasource.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/models/pokemon_detail_model.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/pokemon_details.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/repositories/pokemon_details_repository.dart';

part 'pokemon_detail_repository_impl.g.dart';

class PokemonDetailRepositoryImpl implements IPokemonDetailRepository {
  const PokemonDetailRepositoryImpl(this._datasource);
  final IPokemonDetailRemoteDatasource _datasource;

  @override
  TaskEither<AppException, PokemonDetail> getPokemonDetail(String name) =>
      _datasource.fetchPokemonDetail(name).map(_toEntity);

  // ── Private mapper: Model → Entity (DIP: domain knows nothing of data) ──
  PokemonDetail _toEntity(PokemonDetailModel model) {
    return PokemonDetail(
      id: model.id,
      name: model.name,
      height: model.height,
      weight: model.weight,
      baseExperience: model.baseExperience,
      types: model.types.map((t) => t.type.name).toList(),
      stats: {for (var s in model.stats) s.stat.name: s.baseStat},
      abilities: model.abilities.map((a) => a.ability.name).toList(),
      imageUrl:
          model.sprites.other?.officialArtwork?.frontDefault ??
          model.sprites.frontDefault,
    );
  }
}

@riverpod
IPokemonDetailRepository pokemonDetailRepository(Ref ref) =>
    PokemonDetailRepositoryImpl(
      ref.read(pokemonDetailRemoteDatasourceProvider),
    );
