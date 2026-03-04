// ══════════════════════════════════════════════════════════════════════════════
// features/pokemon_detail/data/datasource/pokemon_detail_remote_datasource.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/error/failure_handler.dart';
import 'package:pokedex_global66/core/network/api_constants.dart';
import 'package:pokedex_global66/core/network/dio_client.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/models/pokemon_detail_model.dart';

part 'pokemon_detail_remote_datasource.g.dart';

/// Contract — ISP: one interface per datasource.
abstract interface class IPokemonDetailRemoteDatasource {
  TaskEither<AppException, PokemonDetailModel> fetchPokemonDetail(
    String name, {
    String? language,
  });
  TaskEither<AppException, PokemonSpeciesModel> fetchPokemonSpecies(
    int id, {
    String? language,
  });
  TaskEither<AppException, PokemonTypeDetailsModel> fetchTypeDetails(
    String typeName, {
    String? language,
  });
  TaskEither<AppException, AbilityDetailsModel> fetchAbilityDetails(
    String abilityName, {
    String? language,
  });
}

/// Implementation — depends on [Dio], injected via Riverpod.
class PokemonDetailRemoteDatasource implements IPokemonDetailRemoteDatasource {
  const PokemonDetailRemoteDatasource(this._dio);
  final Dio _dio;

  @override
  TaskEither<AppException, PokemonDetailModel> fetchPokemonDetail(
    String name, {
    String? language,
  }) => TaskEither.tryCatch(() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.pokemonDetail(name),
      queryParameters: language != null ? {'lang': language} : null,
    );
    return PokemonDetailModel.fromJson(response.data!);
  }, (e, _) => FailureHandler.fromObject(e));

  @override
  TaskEither<AppException, PokemonSpeciesModel> fetchPokemonSpecies(
    int id, {
    String? language,
  }) => TaskEither.tryCatch(() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.pokemonSpecies(id),
      queryParameters: language != null ? {'lang': language} : null,
    );
    return PokemonSpeciesModel.fromJson(response.data!);
  }, (e, _) => FailureHandler.fromObject(e));

  @override
  TaskEither<AppException, PokemonTypeDetailsModel> fetchTypeDetails(
    String typeName, {
    String? language,
  }) => TaskEither.tryCatch(() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.typeDetail(typeName),
      queryParameters: language != null ? {'lang': language} : null,
    );
    return PokemonTypeDetailsModel.fromJson(response.data!);
  }, (e, _) => FailureHandler.fromObject(e));

  @override
  TaskEither<AppException, AbilityDetailsModel> fetchAbilityDetails(
    String abilityName, {
    String? language,
  }) => TaskEither.tryCatch(() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.abilityDetail(abilityName),
      queryParameters: language != null ? {'lang': language} : null,
    );
    return AbilityDetailsModel.fromJson(response.data!);
  }, (e, _) => FailureHandler.fromObject(e));
}

@Riverpod(keepAlive: true)
IPokemonDetailRemoteDatasource pokemonDetailRemoteDatasource(Ref ref) =>
    PokemonDetailRemoteDatasource(ref.read(dioClientProvider));
