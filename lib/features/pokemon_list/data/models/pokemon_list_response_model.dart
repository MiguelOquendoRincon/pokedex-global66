// ─── pokemon_list_response_model.dart ────────────────────────────────────────
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_global66/features/pokemon_detail/data/models/pokemon_detail_model.dart';
import 'pokemon_item_model.dart';

part 'pokemon_list_response_model.freezed.dart';
part 'pokemon_list_response_model.g.dart';

/// Envelope returned by GET /pokemon?limit=N&offset=N
@freezed
abstract class PokemonListResponseModel with _$PokemonListResponseModel {
  const factory PokemonListResponseModel({
    required int count,
    String? next,
    String? previous,
    required List<PokemonItemModel> results,
  }) = _PokemonListResponseModel;

  factory PokemonListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseModelFromJson(json);
}
