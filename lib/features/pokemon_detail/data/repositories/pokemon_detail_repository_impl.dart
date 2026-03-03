// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_detail/data/repositories/pokemon_detail_repository_impl.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/datasource/pokemon_detail_remote_datasource.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/models/pokemon_detail_model.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/entities/pokemon_details.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/repositories/pokemon_details_repository.dart';

part 'pokemon_detail_repository_impl.g.dart';

class PokemonDetailRepositoryImpl implements IPokemonDetailRepository {
  const PokemonDetailRepositoryImpl(this._datasource);
  final IPokemonDetailRemoteDatasource _datasource;

  @override
  TaskEither<AppException, PokemonDetail> getPokemonDetail(
    String name,
    String language,
  ) {
    return _datasource.fetchPokemonDetail(name, language: language).flatMap((
      model,
    ) {
      // 1. Fetch Species info for more metadata
      final speciesTask = _datasource.fetchPokemonSpecies(
        model.id,
        language: language,
      );

      // 2. Fetch Type details for weakness calculation
      final typeTasks = model.types.map(
        (t) => _datasource.fetchTypeDetails(t.type.name, language: language),
      );

      return TaskEither.sequenceList(typeTasks.toList()).flatMap((typeDetails) {
        return speciesTask.map((species) {
          final weaknesses = _calculateWeaknesses(typeDetails);
          return _toEntity(model, species, weaknesses, language);
        });
      });
    });
  }

  // ── Weakness Logic ───────────────────────────────────────────────────────
  List<String> _calculateWeaknesses(List<PokemonTypeDetailsModel> types) {
    final multipliers = <String, double>{};

    for (final typeDetail in types) {
      for (final d in typeDetail.damageRelations.doubleDamageFrom) {
        multipliers[d.name] = (multipliers[d.name] ?? 1.0) * 2.0;
      }
      for (final d in typeDetail.damageRelations.halfDamageFrom) {
        multipliers[d.name] = (multipliers[d.name] ?? 1.0) * 0.5;
      }
      for (final d in typeDetail.damageRelations.noDamageFrom) {
        multipliers[d.name] = (multipliers[d.name] ?? 1.0) * 0.0;
      }
    }

    // A weakness is any type with a multiplier > 1.0
    return multipliers.entries
        .where((e) => e.value > 1.0)
        .map((e) => e.key)
        .toList();
  }

  // ── Private mapper: Models → Entity ───────────────────────────────────────
  PokemonDetail _toEntity(
    PokemonDetailModel model,
    PokemonSpeciesModel species,
    List<String> weaknesses,
    String language,
  ) {
    // Find flavor text in requested language
    final description = species.flavorTextEntries
        .firstWhere(
          (e) => e.language.name == language,
          orElse: () => species.flavorTextEntries.firstWhere(
            (e) => e.language.name == 'en',
            orElse: () => species.flavorTextEntries.first,
          ),
        )
        .flavorText
        .replaceAll('\n', ' ')
        .replaceAll('\f', ' ');

    // Find genus in requested language
    final category = species.genera
        .firstWhere(
          (g) => g.language.name == language,
          orElse: () => species.genera.firstWhere(
            (g) => g.language.name == 'en',
            orElse: () => species.genera.first,
          ),
        )
        .genus;

    return PokemonDetail(
      id: model.id,
      name: model.name,
      height: model.height,
      weight: model.weight,
      baseExperience: model.baseExperience,
      types: model.types.map((t) => t.type.name).toList(),
      stats: {for (var s in model.stats) s.stat.name: s.baseStat},
      abilities: model.abilities.map((a) => a.ability.name).toList(),
      weaknesses: weaknesses,
      description: description,
      category: category,
      genderRate: species.genderRate,
      imageUrl:
          model.sprites.other?.officialArtwork?.frontDefault ??
          model.sprites.frontDefault,
    );
  }
}

@Riverpod(keepAlive: true)
IPokemonDetailRepository pokemonDetailRepository(Ref ref) =>
    PokemonDetailRepositoryImpl(
      ref.read(pokemonDetailRemoteDatasourceProvider),
    );
