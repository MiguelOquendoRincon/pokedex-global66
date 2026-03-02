// ══════════════════════════════════════════════════════════════════════════════
// pokemon_list_remote_datasource.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/error/failure_handler.dart';
import 'package:pokedex_global66/core/network/api_constants.dart';
import 'package:pokedex_global66/core/network/dio_client.dart';
import 'package:pokedex_global66/features/pokemon_list/data/models/pokemon_list_response_model.dart';

part 'pokemon_list_remote_datasource.g.dart';

/// Contract — ISP: one interface per datasource.
abstract interface class IPokemonListRemoteDatasource {
  TaskEither<AppException, PokemonListResponseModel> fetchPokemonList({
    required int limit,
    required int offset,
  });
}

/// Implementation — depends on [Dio], injected via Riverpod.
class PokemonListRemoteDatasource implements IPokemonListRemoteDatasource {
  const PokemonListRemoteDatasource(this._dio);
  final Dio _dio;

  @override
  TaskEither<AppException, PokemonListResponseModel> fetchPokemonList({
    required int limit,
    required int offset,
  }) => TaskEither.tryCatch(() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.pokemonList,
      queryParameters: {'limit': limit, 'offset': offset},
    );
    return PokemonListResponseModel.fromJson(response.data!);
  }, (e, _) => FailureHandler.fromObject(e));
}

@riverpod
IPokemonListRemoteDatasource pokemonListRemoteDatasource(Ref ref) =>
    PokemonListRemoteDatasource(ref.read(dioClientProvider));
