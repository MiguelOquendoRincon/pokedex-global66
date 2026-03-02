// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PokemonListResponseModel _$PokemonListResponseModelFromJson(
  Map<String, dynamic> json,
) => _PokemonListResponseModel(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => PokemonItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PokemonListResponseModelToJson(
  _PokemonListResponseModel instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
