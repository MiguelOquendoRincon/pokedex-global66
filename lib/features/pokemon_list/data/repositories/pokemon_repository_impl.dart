// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_list/data/repositories/pokemon_repository_impl.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';
import 'package:pokedex_global66/features/pokemon_list/data/datasource/pokemon_list_remote_datasource.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/repositories/i_pokemon_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/app_exception.dart';
import '../models/pokemon_item_model.dart';

part 'pokemon_repository_impl.g.dart';

/// Implementation of [IPokemonRepository] that fetches data from a remote datasource.
class PokemonRepositoryImpl implements IPokemonRepository {
  const PokemonRepositoryImpl(this._datasource);
  final IPokemonListRemoteDatasource _datasource;

  @override
  /// Retrieves a paginated list of Pokémon summaries from the external API.
  TaskEither<AppException, List<PokemonSummary>> getPokemonList({
    required int limit,
    required int offset,
  }) => _datasource
      .fetchPokemonList(limit: limit, offset: offset)
      .map((response) => response.results.map(_toEntity).toList());

  // ── Private mapper: Model → Entity (DIP: domain knows nothing of data) ──
  PokemonSummary _toEntity(PokemonItemModel model) =>
      PokemonSummary(name: model.name, id: _extractIdFromUrl(model.url));

  /// e.g. "https://pokeapi.co/api/v2/pokemon/25/" → 25
  int _extractIdFromUrl(String url) {
    final segments = url.split('/')..removeWhere((s) => s.isEmpty);
    return int.tryParse(segments.last) ?? 0;
  }
}

/// A provider that exposes the [IPokemonRepository] implementation.
@Riverpod(keepAlive: true)
IPokemonRepository pokemonRepository(Ref ref) =>
    PokemonRepositoryImpl(ref.read(pokemonListRemoteDatasourceProvider));
