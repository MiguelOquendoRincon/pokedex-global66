// ─── pokemon_item_model.dart ──────────────────────────────────────────────────
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_item_model.freezed.dart';
part 'pokemon_item_model.g.dart';

/// Raw API item from the list endpoint.
/// { "name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/" }
@freezed
abstract class PokemonItemModel with _$PokemonItemModel {
  const factory PokemonItemModel({required String name, required String url}) =
      _PokemonItemModel;

  factory PokemonItemModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonItemModelFromJson(json);
}
