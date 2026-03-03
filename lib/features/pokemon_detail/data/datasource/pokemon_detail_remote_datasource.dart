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
  TaskEither<AppException, PokemonDetailModel> fetchPokemonDetail(String name);
}

/// Implementation — depends on [Dio], injected via Riverpod.
class PokemonDetailRemoteDatasource implements IPokemonDetailRemoteDatasource {
  const PokemonDetailRemoteDatasource(this._dio);
  final Dio _dio;

  @override
  TaskEither<AppException, PokemonDetailModel> fetchPokemonDetail(
    String name,
  ) => TaskEither.tryCatch(() async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.pokemonDetail(name),
    );
    return PokemonDetailModel.fromJson(response.data!);
  }, (e, _) => FailureHandler.fromObject(e));
}

@Riverpod(keepAlive: true)
IPokemonDetailRemoteDatasource pokemonDetailRemoteDatasource(Ref ref) =>
    PokemonDetailRemoteDatasource(ref.read(dioClientProvider));
