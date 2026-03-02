import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail_model.freezed.dart';
part 'pokemon_detail_model.g.dart';

/// Full response from GET /pokemon/{name}
/// Only the fields we actually use are mapped — YAGNI principle.
@freezed
abstract class PokemonDetailModel with _$PokemonDetailModel {
  const factory PokemonDetailModel({
    required int id,
    required String name,
    required int baseExperience,
    required int height,
    required int weight,
    required List<PokemonTypeSlotModel> types,
    required List<PokemonStatModel> stats,
    required List<PokemonAbilitySlotModel> abilities,
    required PokemonSpritesModel sprites,
  }) = _PokemonDetailModel;

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailModelFromJson(json);
}

// ─── Type slot ───────────────────────────────────────────────────────────────

@freezed
abstract class PokemonTypeSlotModel with _$PokemonTypeSlotModel {
  const factory PokemonTypeSlotModel({
    required int slot,
    required PokemonTypeModel type,
  }) = _PokemonTypeSlotModel;

  factory PokemonTypeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSlotModelFromJson(json);
}

@freezed
abstract class PokemonTypeModel with _$PokemonTypeModel {
  const factory PokemonTypeModel({required String name, required String url}) =
      _PokemonTypeModel;

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeModelFromJson(json);
}

// ─── Stat ────────────────────────────────────────────────────────────────────

@freezed
abstract class PokemonStatModel with _$PokemonStatModel {
  const factory PokemonStatModel({
    @JsonKey(name: 'base_stat') required int baseStat,
    required int effort,
    required PokemonStatInfoModel stat,
  }) = _PokemonStatModel;

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatModelFromJson(json);
}

@freezed
abstract class PokemonStatInfoModel with _$PokemonStatInfoModel {
  const factory PokemonStatInfoModel({
    required String name,
    required String url,
  }) = _PokemonStatInfoModel;

  factory PokemonStatInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatInfoModelFromJson(json);
}

// ─── Ability ─────────────────────────────────────────────────────────────────

@freezed
abstract class PokemonAbilitySlotModel with _$PokemonAbilitySlotModel {
  const factory PokemonAbilitySlotModel({
    @JsonKey(name: 'is_hidden') required bool isHidden,
    required int slot,
    required PokemonAbilityInfoModel ability,
  }) = _PokemonAbilitySlotModel;

  factory PokemonAbilitySlotModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilitySlotModelFromJson(json);
}

@freezed
abstract class PokemonAbilityInfoModel with _$PokemonAbilityInfoModel {
  const factory PokemonAbilityInfoModel({
    required String name,
    required String url,
  }) = _PokemonAbilityInfoModel;

  factory PokemonAbilityInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityInfoModelFromJson(json);
}

// ─── Sprites ─────────────────────────────────────────────────────────────────

@freezed
abstract class PokemonSpritesModel with _$PokemonSpritesModel {
  const factory PokemonSpritesModel({
    @JsonKey(name: 'front_default') String? frontDefault,
    @JsonKey(name: 'front_shiny') String? frontShiny,
    PokemonOtherSpritesModel? other,
  }) = _PokemonSpritesModel;

  factory PokemonSpritesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesModelFromJson(json);
}

@freezed
abstract class PokemonOtherSpritesModel with _$PokemonOtherSpritesModel {
  const factory PokemonOtherSpritesModel({
    @JsonKey(name: 'official-artwork')
    PokemonOfficialArtworkModel? officialArtwork,
  }) = _PokemonOtherSpritesModel;

  factory PokemonOtherSpritesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonOtherSpritesModelFromJson(json);
}

@freezed
abstract class PokemonOfficialArtworkModel with _$PokemonOfficialArtworkModel {
  const factory PokemonOfficialArtworkModel({
    @JsonKey(name: 'front_default') String? frontDefault,
    @JsonKey(name: 'front_shiny') String? frontShiny,
  }) = _PokemonOfficialArtworkModel;

  factory PokemonOfficialArtworkModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonOfficialArtworkModelFromJson(json);
}
