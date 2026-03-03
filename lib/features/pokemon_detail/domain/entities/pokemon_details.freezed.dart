// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PokemonDetail {

 int get id; String get name; int get height;// decimetres
 int get weight;// hectograms
 int get baseExperience; List<String> get types; Map<String, int> get stats; List<String> get abilities; List<String> get weaknesses; String get description; String get category; int get genderRate;// -1: genderless, 0..8: female rate in eighths
 String? get imageUrl;
/// Create a copy of PokemonDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonDetailCopyWith<PokemonDetail> get copyWith => _$PokemonDetailCopyWithImpl<PokemonDetail>(this as PokemonDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.baseExperience, baseExperience) || other.baseExperience == baseExperience)&&const DeepCollectionEquality().equals(other.types, types)&&const DeepCollectionEquality().equals(other.stats, stats)&&const DeepCollectionEquality().equals(other.abilities, abilities)&&const DeepCollectionEquality().equals(other.weaknesses, weaknesses)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.genderRate, genderRate) || other.genderRate == genderRate)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,height,weight,baseExperience,const DeepCollectionEquality().hash(types),const DeepCollectionEquality().hash(stats),const DeepCollectionEquality().hash(abilities),const DeepCollectionEquality().hash(weaknesses),description,category,genderRate,imageUrl);

@override
String toString() {
  return 'PokemonDetail(id: $id, name: $name, height: $height, weight: $weight, baseExperience: $baseExperience, types: $types, stats: $stats, abilities: $abilities, weaknesses: $weaknesses, description: $description, category: $category, genderRate: $genderRate, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $PokemonDetailCopyWith<$Res>  {
  factory $PokemonDetailCopyWith(PokemonDetail value, $Res Function(PokemonDetail) _then) = _$PokemonDetailCopyWithImpl;
@useResult
$Res call({
 int id, String name, int height, int weight, int baseExperience, List<String> types, Map<String, int> stats, List<String> abilities, List<String> weaknesses, String description, String category, int genderRate, String? imageUrl
});




}
/// @nodoc
class _$PokemonDetailCopyWithImpl<$Res>
    implements $PokemonDetailCopyWith<$Res> {
  _$PokemonDetailCopyWithImpl(this._self, this._then);

  final PokemonDetail _self;
  final $Res Function(PokemonDetail) _then;

/// Create a copy of PokemonDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? height = null,Object? weight = null,Object? baseExperience = null,Object? types = null,Object? stats = null,Object? abilities = null,Object? weaknesses = null,Object? description = null,Object? category = null,Object? genderRate = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,baseExperience: null == baseExperience ? _self.baseExperience : baseExperience // ignore: cast_nullable_to_non_nullable
as int,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<String>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as Map<String, int>,abilities: null == abilities ? _self.abilities : abilities // ignore: cast_nullable_to_non_nullable
as List<String>,weaknesses: null == weaknesses ? _self.weaknesses : weaknesses // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,genderRate: null == genderRate ? _self.genderRate : genderRate // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonDetail].
extension PokemonDetailPatterns on PokemonDetail {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonDetail() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonDetail value)  $default,){
final _that = this;
switch (_that) {
case _PokemonDetail():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonDetail value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonDetail() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int height,  int weight,  int baseExperience,  List<String> types,  Map<String, int> stats,  List<String> abilities,  List<String> weaknesses,  String description,  String category,  int genderRate,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonDetail() when $default != null:
return $default(_that.id,_that.name,_that.height,_that.weight,_that.baseExperience,_that.types,_that.stats,_that.abilities,_that.weaknesses,_that.description,_that.category,_that.genderRate,_that.imageUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int height,  int weight,  int baseExperience,  List<String> types,  Map<String, int> stats,  List<String> abilities,  List<String> weaknesses,  String description,  String category,  int genderRate,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _PokemonDetail():
return $default(_that.id,_that.name,_that.height,_that.weight,_that.baseExperience,_that.types,_that.stats,_that.abilities,_that.weaknesses,_that.description,_that.category,_that.genderRate,_that.imageUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int height,  int weight,  int baseExperience,  List<String> types,  Map<String, int> stats,  List<String> abilities,  List<String> weaknesses,  String description,  String category,  int genderRate,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _PokemonDetail() when $default != null:
return $default(_that.id,_that.name,_that.height,_that.weight,_that.baseExperience,_that.types,_that.stats,_that.abilities,_that.weaknesses,_that.description,_that.category,_that.genderRate,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _PokemonDetail extends PokemonDetail {
  const _PokemonDetail({required this.id, required this.name, required this.height, required this.weight, required this.baseExperience, required final  List<String> types, required final  Map<String, int> stats, required final  List<String> abilities, required final  List<String> weaknesses, required this.description, required this.category, required this.genderRate, this.imageUrl}): _types = types,_stats = stats,_abilities = abilities,_weaknesses = weaknesses,super._();
  

@override final  int id;
@override final  String name;
@override final  int height;
// decimetres
@override final  int weight;
// hectograms
@override final  int baseExperience;
 final  List<String> _types;
@override List<String> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

 final  Map<String, int> _stats;
@override Map<String, int> get stats {
  if (_stats is EqualUnmodifiableMapView) return _stats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_stats);
}

 final  List<String> _abilities;
@override List<String> get abilities {
  if (_abilities is EqualUnmodifiableListView) return _abilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_abilities);
}

 final  List<String> _weaknesses;
@override List<String> get weaknesses {
  if (_weaknesses is EqualUnmodifiableListView) return _weaknesses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weaknesses);
}

@override final  String description;
@override final  String category;
@override final  int genderRate;
// -1: genderless, 0..8: female rate in eighths
@override final  String? imageUrl;

/// Create a copy of PokemonDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonDetailCopyWith<_PokemonDetail> get copyWith => __$PokemonDetailCopyWithImpl<_PokemonDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.baseExperience, baseExperience) || other.baseExperience == baseExperience)&&const DeepCollectionEquality().equals(other._types, _types)&&const DeepCollectionEquality().equals(other._stats, _stats)&&const DeepCollectionEquality().equals(other._abilities, _abilities)&&const DeepCollectionEquality().equals(other._weaknesses, _weaknesses)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.genderRate, genderRate) || other.genderRate == genderRate)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,height,weight,baseExperience,const DeepCollectionEquality().hash(_types),const DeepCollectionEquality().hash(_stats),const DeepCollectionEquality().hash(_abilities),const DeepCollectionEquality().hash(_weaknesses),description,category,genderRate,imageUrl);

@override
String toString() {
  return 'PokemonDetail(id: $id, name: $name, height: $height, weight: $weight, baseExperience: $baseExperience, types: $types, stats: $stats, abilities: $abilities, weaknesses: $weaknesses, description: $description, category: $category, genderRate: $genderRate, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$PokemonDetailCopyWith<$Res> implements $PokemonDetailCopyWith<$Res> {
  factory _$PokemonDetailCopyWith(_PokemonDetail value, $Res Function(_PokemonDetail) _then) = __$PokemonDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int height, int weight, int baseExperience, List<String> types, Map<String, int> stats, List<String> abilities, List<String> weaknesses, String description, String category, int genderRate, String? imageUrl
});




}
/// @nodoc
class __$PokemonDetailCopyWithImpl<$Res>
    implements _$PokemonDetailCopyWith<$Res> {
  __$PokemonDetailCopyWithImpl(this._self, this._then);

  final _PokemonDetail _self;
  final $Res Function(_PokemonDetail) _then;

/// Create a copy of PokemonDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? height = null,Object? weight = null,Object? baseExperience = null,Object? types = null,Object? stats = null,Object? abilities = null,Object? weaknesses = null,Object? description = null,Object? category = null,Object? genderRate = null,Object? imageUrl = freezed,}) {
  return _then(_PokemonDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,baseExperience: null == baseExperience ? _self.baseExperience : baseExperience // ignore: cast_nullable_to_non_nullable
as int,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<String>,stats: null == stats ? _self._stats : stats // ignore: cast_nullable_to_non_nullable
as Map<String, int>,abilities: null == abilities ? _self._abilities : abilities // ignore: cast_nullable_to_non_nullable
as List<String>,weaknesses: null == weaknesses ? _self._weaknesses : weaknesses // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,genderRate: null == genderRate ? _self.genderRate : genderRate // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
