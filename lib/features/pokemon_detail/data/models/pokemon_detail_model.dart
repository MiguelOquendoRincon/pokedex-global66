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
    @JsonKey(name: 'base_experience') required int baseExperience,
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

// ─── Species ─────────────────────────────────────────────────────────────────

@freezed
abstract class PokemonSpeciesModel with _$PokemonSpeciesModel {
  const factory PokemonSpeciesModel({
    @JsonKey(name: 'gender_rate') required int genderRate,
    @JsonKey(name: 'flavor_text_entries')
    required List<FlavorTextEntryModel> flavorTextEntries,
    required List<GenusModel> genera,
  }) = _PokemonSpeciesModel;

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesModelFromJson(json);
}

@freezed
abstract class FlavorTextEntryModel with _$FlavorTextEntryModel {
  const factory FlavorTextEntryModel({
    @JsonKey(name: 'flavor_text') required String flavorText,
    required NamedAPIResourceModel language,
    required NamedAPIResourceModel version,
  }) = _FlavorTextEntryModel;

  factory FlavorTextEntryModel.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntryModelFromJson(json);
}

@freezed
abstract class GenusModel with _$GenusModel {
  const factory GenusModel({
    required String genus,
    required NamedAPIResourceModel language,
  }) = _GenusModel;

  factory GenusModel.fromJson(Map<String, dynamic> json) =>
      _$GenusModelFromJson(json);
}

@freezed
abstract class NamedAPIResourceModel with _$NamedAPIResourceModel {
  const factory NamedAPIResourceModel({
    required String name,
    required String url,
  }) = _NamedAPIResourceModel;

  factory NamedAPIResourceModel.fromJson(Map<String, dynamic> json) =>
      _$NamedAPIResourceModelFromJson(json);
}

// ─── Type Details ────────────────────────────────────────────────────────────

@freezed
abstract class PokemonTypeDetailsModel with _$PokemonTypeDetailsModel {
  const factory PokemonTypeDetailsModel({
    required String name,
    @JsonKey(name: 'damage_relations')
    required TypeDamageRelationsModel damageRelations,
  }) = _PokemonTypeDetailsModel;

  factory PokemonTypeDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeDetailsModelFromJson(json);
}

@freezed
abstract class TypeDamageRelationsModel with _$TypeDamageRelationsModel {
  const factory TypeDamageRelationsModel({
    @JsonKey(name: 'double_damage_from')
    required List<NamedAPIResourceModel> doubleDamageFrom,
    @JsonKey(name: 'half_damage_from')
    required List<NamedAPIResourceModel> halfDamageFrom,
    @JsonKey(name: 'no_damage_from')
    required List<NamedAPIResourceModel> noDamageFrom,
  }) = _TypeDamageRelationsModel;

  factory TypeDamageRelationsModel.fromJson(Map<String, dynamic> json) =>
      _$TypeDamageRelationsModelFromJson(json);
}

// ─── Ability Details ──────────────────────────────────────────────────────────

@freezed
abstract class AbilityDetailsModel with _$AbilityDetailsModel {
  const factory AbilityDetailsModel({
    required int id,
    required String name,
    required List<AbilityNameModel> names,
  }) = _AbilityDetailsModel;

  factory AbilityDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AbilityDetailsModelFromJson(json);
}

@freezed
abstract class AbilityNameModel with _$AbilityNameModel {
  const factory AbilityNameModel({
    required String name,
    required NamedAPIResourceModel language,
  }) = _AbilityNameModel;

  factory AbilityNameModel.fromJson(Map<String, dynamic> json) =>
      _$AbilityNameModelFromJson(json);
}
