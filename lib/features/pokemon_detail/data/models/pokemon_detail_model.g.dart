// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PokemonDetailModel _$PokemonDetailModelFromJson(Map<String, dynamic> json) =>
    _PokemonDetailModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      baseExperience: (json['base_experience'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonTypeSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map(
            (e) => PokemonAbilitySlotModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      sprites: PokemonSpritesModel.fromJson(
        json['sprites'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PokemonDetailModelToJson(_PokemonDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'types': instance.types,
      'stats': instance.stats,
      'abilities': instance.abilities,
      'sprites': instance.sprites,
    };

_PokemonTypeSlotModel _$PokemonTypeSlotModelFromJson(
  Map<String, dynamic> json,
) => _PokemonTypeSlotModel(
  slot: (json['slot'] as num).toInt(),
  type: PokemonTypeModel.fromJson(json['type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PokemonTypeSlotModelToJson(
  _PokemonTypeSlotModel instance,
) => <String, dynamic>{'slot': instance.slot, 'type': instance.type};

_PokemonTypeModel _$PokemonTypeModelFromJson(Map<String, dynamic> json) =>
    _PokemonTypeModel(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$PokemonTypeModelToJson(_PokemonTypeModel instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_PokemonStatModel _$PokemonStatModelFromJson(Map<String, dynamic> json) =>
    _PokemonStatModel(
      baseStat: (json['base_stat'] as num).toInt(),
      effort: (json['effort'] as num).toInt(),
      stat: PokemonStatInfoModel.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonStatModelToJson(_PokemonStatModel instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

_PokemonStatInfoModel _$PokemonStatInfoModelFromJson(
  Map<String, dynamic> json,
) => _PokemonStatInfoModel(
  name: json['name'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$PokemonStatInfoModelToJson(
  _PokemonStatInfoModel instance,
) => <String, dynamic>{'name': instance.name, 'url': instance.url};

_PokemonAbilitySlotModel _$PokemonAbilitySlotModelFromJson(
  Map<String, dynamic> json,
) => _PokemonAbilitySlotModel(
  isHidden: json['is_hidden'] as bool,
  slot: (json['slot'] as num).toInt(),
  ability: PokemonAbilityInfoModel.fromJson(
    json['ability'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PokemonAbilitySlotModelToJson(
  _PokemonAbilitySlotModel instance,
) => <String, dynamic>{
  'is_hidden': instance.isHidden,
  'slot': instance.slot,
  'ability': instance.ability,
};

_PokemonAbilityInfoModel _$PokemonAbilityInfoModelFromJson(
  Map<String, dynamic> json,
) => _PokemonAbilityInfoModel(
  name: json['name'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$PokemonAbilityInfoModelToJson(
  _PokemonAbilityInfoModel instance,
) => <String, dynamic>{'name': instance.name, 'url': instance.url};

_PokemonSpritesModel _$PokemonSpritesModelFromJson(Map<String, dynamic> json) =>
    _PokemonSpritesModel(
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
      other: json['other'] == null
          ? null
          : PokemonOtherSpritesModel.fromJson(
              json['other'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PokemonSpritesModelToJson(
  _PokemonSpritesModel instance,
) => <String, dynamic>{
  'front_default': instance.frontDefault,
  'front_shiny': instance.frontShiny,
  'other': instance.other,
};

_PokemonOtherSpritesModel _$PokemonOtherSpritesModelFromJson(
  Map<String, dynamic> json,
) => _PokemonOtherSpritesModel(
  officialArtwork: json['official-artwork'] == null
      ? null
      : PokemonOfficialArtworkModel.fromJson(
          json['official-artwork'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PokemonOtherSpritesModelToJson(
  _PokemonOtherSpritesModel instance,
) => <String, dynamic>{'official-artwork': instance.officialArtwork};

_PokemonOfficialArtworkModel _$PokemonOfficialArtworkModelFromJson(
  Map<String, dynamic> json,
) => _PokemonOfficialArtworkModel(
  frontDefault: json['front_default'] as String?,
  frontShiny: json['front_shiny'] as String?,
);

Map<String, dynamic> _$PokemonOfficialArtworkModelToJson(
  _PokemonOfficialArtworkModel instance,
) => <String, dynamic>{
  'front_default': instance.frontDefault,
  'front_shiny': instance.frontShiny,
};

_PokemonSpeciesModel _$PokemonSpeciesModelFromJson(Map<String, dynamic> json) =>
    _PokemonSpeciesModel(
      genderRate: (json['gender_rate'] as num).toInt(),
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => FlavorTextEntryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      genera: (json['genera'] as List<dynamic>)
          .map((e) => GenusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonSpeciesModelToJson(
  _PokemonSpeciesModel instance,
) => <String, dynamic>{
  'gender_rate': instance.genderRate,
  'flavor_text_entries': instance.flavorTextEntries,
  'genera': instance.genera,
};

_FlavorTextEntryModel _$FlavorTextEntryModelFromJson(
  Map<String, dynamic> json,
) => _FlavorTextEntryModel(
  flavorText: json['flavor_text'] as String,
  language: NamedAPIResourceModel.fromJson(
    json['language'] as Map<String, dynamic>,
  ),
  version: NamedAPIResourceModel.fromJson(
    json['version'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$FlavorTextEntryModelToJson(
  _FlavorTextEntryModel instance,
) => <String, dynamic>{
  'flavor_text': instance.flavorText,
  'language': instance.language,
  'version': instance.version,
};

_GenusModel _$GenusModelFromJson(Map<String, dynamic> json) => _GenusModel(
  genus: json['genus'] as String,
  language: NamedAPIResourceModel.fromJson(
    json['language'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GenusModelToJson(_GenusModel instance) =>
    <String, dynamic>{'genus': instance.genus, 'language': instance.language};

_NamedAPIResourceModel _$NamedAPIResourceModelFromJson(
  Map<String, dynamic> json,
) => _NamedAPIResourceModel(
  name: json['name'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$NamedAPIResourceModelToJson(
  _NamedAPIResourceModel instance,
) => <String, dynamic>{'name': instance.name, 'url': instance.url};

_PokemonTypeDetailsModel _$PokemonTypeDetailsModelFromJson(
  Map<String, dynamic> json,
) => _PokemonTypeDetailsModel(
  name: json['name'] as String,
  damageRelations: TypeDamageRelationsModel.fromJson(
    json['damage_relations'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PokemonTypeDetailsModelToJson(
  _PokemonTypeDetailsModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'damage_relations': instance.damageRelations,
};

_TypeDamageRelationsModel _$TypeDamageRelationsModelFromJson(
  Map<String, dynamic> json,
) => _TypeDamageRelationsModel(
  doubleDamageFrom: (json['double_damage_from'] as List<dynamic>)
      .map((e) => NamedAPIResourceModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  halfDamageFrom: (json['half_damage_from'] as List<dynamic>)
      .map((e) => NamedAPIResourceModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  noDamageFrom: (json['no_damage_from'] as List<dynamic>)
      .map((e) => NamedAPIResourceModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TypeDamageRelationsModelToJson(
  _TypeDamageRelationsModel instance,
) => <String, dynamic>{
  'double_damage_from': instance.doubleDamageFrom,
  'half_damage_from': instance.halfDamageFrom,
  'no_damage_from': instance.noDamageFrom,
};
