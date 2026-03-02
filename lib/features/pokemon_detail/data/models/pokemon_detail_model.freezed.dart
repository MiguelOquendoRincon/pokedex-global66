// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonDetailModel {

 int get id; String get name; int get baseExperience; int get height; int get weight; List<PokemonTypeSlotModel> get types; List<PokemonStatModel> get stats; List<PokemonAbilitySlotModel> get abilities; PokemonSpritesModel get sprites;
/// Create a copy of PokemonDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonDetailModelCopyWith<PokemonDetailModel> get copyWith => _$PokemonDetailModelCopyWithImpl<PokemonDetailModel>(this as PokemonDetailModel, _$identity);

  /// Serializes this PokemonDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.baseExperience, baseExperience) || other.baseExperience == baseExperience)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&const DeepCollectionEquality().equals(other.types, types)&&const DeepCollectionEquality().equals(other.stats, stats)&&const DeepCollectionEquality().equals(other.abilities, abilities)&&(identical(other.sprites, sprites) || other.sprites == sprites));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,baseExperience,height,weight,const DeepCollectionEquality().hash(types),const DeepCollectionEquality().hash(stats),const DeepCollectionEquality().hash(abilities),sprites);

@override
String toString() {
  return 'PokemonDetailModel(id: $id, name: $name, baseExperience: $baseExperience, height: $height, weight: $weight, types: $types, stats: $stats, abilities: $abilities, sprites: $sprites)';
}


}

/// @nodoc
abstract mixin class $PokemonDetailModelCopyWith<$Res>  {
  factory $PokemonDetailModelCopyWith(PokemonDetailModel value, $Res Function(PokemonDetailModel) _then) = _$PokemonDetailModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, int baseExperience, int height, int weight, List<PokemonTypeSlotModel> types, List<PokemonStatModel> stats, List<PokemonAbilitySlotModel> abilities, PokemonSpritesModel sprites
});


$PokemonSpritesModelCopyWith<$Res> get sprites;

}
/// @nodoc
class _$PokemonDetailModelCopyWithImpl<$Res>
    implements $PokemonDetailModelCopyWith<$Res> {
  _$PokemonDetailModelCopyWithImpl(this._self, this._then);

  final PokemonDetailModel _self;
  final $Res Function(PokemonDetailModel) _then;

/// Create a copy of PokemonDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? baseExperience = null,Object? height = null,Object? weight = null,Object? types = null,Object? stats = null,Object? abilities = null,Object? sprites = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,baseExperience: null == baseExperience ? _self.baseExperience : baseExperience // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<PokemonTypeSlotModel>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as List<PokemonStatModel>,abilities: null == abilities ? _self.abilities : abilities // ignore: cast_nullable_to_non_nullable
as List<PokemonAbilitySlotModel>,sprites: null == sprites ? _self.sprites : sprites // ignore: cast_nullable_to_non_nullable
as PokemonSpritesModel,
  ));
}
/// Create a copy of PokemonDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonSpritesModelCopyWith<$Res> get sprites {
  
  return $PokemonSpritesModelCopyWith<$Res>(_self.sprites, (value) {
    return _then(_self.copyWith(sprites: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonDetailModel].
extension PokemonDetailModelPatterns on PokemonDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PokemonDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int baseExperience,  int height,  int weight,  List<PokemonTypeSlotModel> types,  List<PokemonStatModel> stats,  List<PokemonAbilitySlotModel> abilities,  PokemonSpritesModel sprites)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.baseExperience,_that.height,_that.weight,_that.types,_that.stats,_that.abilities,_that.sprites);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int baseExperience,  int height,  int weight,  List<PokemonTypeSlotModel> types,  List<PokemonStatModel> stats,  List<PokemonAbilitySlotModel> abilities,  PokemonSpritesModel sprites)  $default,) {final _that = this;
switch (_that) {
case _PokemonDetailModel():
return $default(_that.id,_that.name,_that.baseExperience,_that.height,_that.weight,_that.types,_that.stats,_that.abilities,_that.sprites);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int baseExperience,  int height,  int weight,  List<PokemonTypeSlotModel> types,  List<PokemonStatModel> stats,  List<PokemonAbilitySlotModel> abilities,  PokemonSpritesModel sprites)?  $default,) {final _that = this;
switch (_that) {
case _PokemonDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.baseExperience,_that.height,_that.weight,_that.types,_that.stats,_that.abilities,_that.sprites);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonDetailModel implements PokemonDetailModel {
  const _PokemonDetailModel({required this.id, required this.name, required this.baseExperience, required this.height, required this.weight, required final  List<PokemonTypeSlotModel> types, required final  List<PokemonStatModel> stats, required final  List<PokemonAbilitySlotModel> abilities, required this.sprites}): _types = types,_stats = stats,_abilities = abilities;
  factory _PokemonDetailModel.fromJson(Map<String, dynamic> json) => _$PokemonDetailModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  int baseExperience;
@override final  int height;
@override final  int weight;
 final  List<PokemonTypeSlotModel> _types;
@override List<PokemonTypeSlotModel> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

 final  List<PokemonStatModel> _stats;
@override List<PokemonStatModel> get stats {
  if (_stats is EqualUnmodifiableListView) return _stats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stats);
}

 final  List<PokemonAbilitySlotModel> _abilities;
@override List<PokemonAbilitySlotModel> get abilities {
  if (_abilities is EqualUnmodifiableListView) return _abilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_abilities);
}

@override final  PokemonSpritesModel sprites;

/// Create a copy of PokemonDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonDetailModelCopyWith<_PokemonDetailModel> get copyWith => __$PokemonDetailModelCopyWithImpl<_PokemonDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.baseExperience, baseExperience) || other.baseExperience == baseExperience)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&const DeepCollectionEquality().equals(other._types, _types)&&const DeepCollectionEquality().equals(other._stats, _stats)&&const DeepCollectionEquality().equals(other._abilities, _abilities)&&(identical(other.sprites, sprites) || other.sprites == sprites));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,baseExperience,height,weight,const DeepCollectionEquality().hash(_types),const DeepCollectionEquality().hash(_stats),const DeepCollectionEquality().hash(_abilities),sprites);

@override
String toString() {
  return 'PokemonDetailModel(id: $id, name: $name, baseExperience: $baseExperience, height: $height, weight: $weight, types: $types, stats: $stats, abilities: $abilities, sprites: $sprites)';
}


}

/// @nodoc
abstract mixin class _$PokemonDetailModelCopyWith<$Res> implements $PokemonDetailModelCopyWith<$Res> {
  factory _$PokemonDetailModelCopyWith(_PokemonDetailModel value, $Res Function(_PokemonDetailModel) _then) = __$PokemonDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int baseExperience, int height, int weight, List<PokemonTypeSlotModel> types, List<PokemonStatModel> stats, List<PokemonAbilitySlotModel> abilities, PokemonSpritesModel sprites
});


@override $PokemonSpritesModelCopyWith<$Res> get sprites;

}
/// @nodoc
class __$PokemonDetailModelCopyWithImpl<$Res>
    implements _$PokemonDetailModelCopyWith<$Res> {
  __$PokemonDetailModelCopyWithImpl(this._self, this._then);

  final _PokemonDetailModel _self;
  final $Res Function(_PokemonDetailModel) _then;

/// Create a copy of PokemonDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? baseExperience = null,Object? height = null,Object? weight = null,Object? types = null,Object? stats = null,Object? abilities = null,Object? sprites = null,}) {
  return _then(_PokemonDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,baseExperience: null == baseExperience ? _self.baseExperience : baseExperience // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<PokemonTypeSlotModel>,stats: null == stats ? _self._stats : stats // ignore: cast_nullable_to_non_nullable
as List<PokemonStatModel>,abilities: null == abilities ? _self._abilities : abilities // ignore: cast_nullable_to_non_nullable
as List<PokemonAbilitySlotModel>,sprites: null == sprites ? _self.sprites : sprites // ignore: cast_nullable_to_non_nullable
as PokemonSpritesModel,
  ));
}

/// Create a copy of PokemonDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonSpritesModelCopyWith<$Res> get sprites {
  
  return $PokemonSpritesModelCopyWith<$Res>(_self.sprites, (value) {
    return _then(_self.copyWith(sprites: value));
  });
}
}


/// @nodoc
mixin _$PokemonTypeSlotModel {

 int get slot; PokemonTypeModel get type;
/// Create a copy of PokemonTypeSlotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonTypeSlotModelCopyWith<PokemonTypeSlotModel> get copyWith => _$PokemonTypeSlotModelCopyWithImpl<PokemonTypeSlotModel>(this as PokemonTypeSlotModel, _$identity);

  /// Serializes this PokemonTypeSlotModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonTypeSlotModel&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slot,type);

@override
String toString() {
  return 'PokemonTypeSlotModel(slot: $slot, type: $type)';
}


}

/// @nodoc
abstract mixin class $PokemonTypeSlotModelCopyWith<$Res>  {
  factory $PokemonTypeSlotModelCopyWith(PokemonTypeSlotModel value, $Res Function(PokemonTypeSlotModel) _then) = _$PokemonTypeSlotModelCopyWithImpl;
@useResult
$Res call({
 int slot, PokemonTypeModel type
});


$PokemonTypeModelCopyWith<$Res> get type;

}
/// @nodoc
class _$PokemonTypeSlotModelCopyWithImpl<$Res>
    implements $PokemonTypeSlotModelCopyWith<$Res> {
  _$PokemonTypeSlotModelCopyWithImpl(this._self, this._then);

  final PokemonTypeSlotModel _self;
  final $Res Function(PokemonTypeSlotModel) _then;

/// Create a copy of PokemonTypeSlotModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slot = null,Object? type = null,}) {
  return _then(_self.copyWith(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PokemonTypeModel,
  ));
}
/// Create a copy of PokemonTypeSlotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonTypeModelCopyWith<$Res> get type {
  
  return $PokemonTypeModelCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonTypeSlotModel].
extension PokemonTypeSlotModelPatterns on PokemonTypeSlotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonTypeSlotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonTypeSlotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonTypeSlotModel value)  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeSlotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonTypeSlotModel value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeSlotModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int slot,  PokemonTypeModel type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonTypeSlotModel() when $default != null:
return $default(_that.slot,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int slot,  PokemonTypeModel type)  $default,) {final _that = this;
switch (_that) {
case _PokemonTypeSlotModel():
return $default(_that.slot,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int slot,  PokemonTypeModel type)?  $default,) {final _that = this;
switch (_that) {
case _PokemonTypeSlotModel() when $default != null:
return $default(_that.slot,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonTypeSlotModel implements PokemonTypeSlotModel {
  const _PokemonTypeSlotModel({required this.slot, required this.type});
  factory _PokemonTypeSlotModel.fromJson(Map<String, dynamic> json) => _$PokemonTypeSlotModelFromJson(json);

@override final  int slot;
@override final  PokemonTypeModel type;

/// Create a copy of PokemonTypeSlotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonTypeSlotModelCopyWith<_PokemonTypeSlotModel> get copyWith => __$PokemonTypeSlotModelCopyWithImpl<_PokemonTypeSlotModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonTypeSlotModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonTypeSlotModel&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slot,type);

@override
String toString() {
  return 'PokemonTypeSlotModel(slot: $slot, type: $type)';
}


}

/// @nodoc
abstract mixin class _$PokemonTypeSlotModelCopyWith<$Res> implements $PokemonTypeSlotModelCopyWith<$Res> {
  factory _$PokemonTypeSlotModelCopyWith(_PokemonTypeSlotModel value, $Res Function(_PokemonTypeSlotModel) _then) = __$PokemonTypeSlotModelCopyWithImpl;
@override @useResult
$Res call({
 int slot, PokemonTypeModel type
});


@override $PokemonTypeModelCopyWith<$Res> get type;

}
/// @nodoc
class __$PokemonTypeSlotModelCopyWithImpl<$Res>
    implements _$PokemonTypeSlotModelCopyWith<$Res> {
  __$PokemonTypeSlotModelCopyWithImpl(this._self, this._then);

  final _PokemonTypeSlotModel _self;
  final $Res Function(_PokemonTypeSlotModel) _then;

/// Create a copy of PokemonTypeSlotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slot = null,Object? type = null,}) {
  return _then(_PokemonTypeSlotModel(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PokemonTypeModel,
  ));
}

/// Create a copy of PokemonTypeSlotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonTypeModelCopyWith<$Res> get type {
  
  return $PokemonTypeModelCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// @nodoc
mixin _$PokemonTypeModel {

 String get name; String get url;
/// Create a copy of PokemonTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonTypeModelCopyWith<PokemonTypeModel> get copyWith => _$PokemonTypeModelCopyWithImpl<PokemonTypeModel>(this as PokemonTypeModel, _$identity);

  /// Serializes this PokemonTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonTypeModel&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonTypeModel(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $PokemonTypeModelCopyWith<$Res>  {
  factory $PokemonTypeModelCopyWith(PokemonTypeModel value, $Res Function(PokemonTypeModel) _then) = _$PokemonTypeModelCopyWithImpl;
@useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class _$PokemonTypeModelCopyWithImpl<$Res>
    implements $PokemonTypeModelCopyWith<$Res> {
  _$PokemonTypeModelCopyWithImpl(this._self, this._then);

  final PokemonTypeModel _self;
  final $Res Function(PokemonTypeModel) _then;

/// Create a copy of PokemonTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonTypeModel].
extension PokemonTypeModelPatterns on PokemonTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonTypeModel() when $default != null:
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String url)  $default,) {final _that = this;
switch (_that) {
case _PokemonTypeModel():
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String url)?  $default,) {final _that = this;
switch (_that) {
case _PokemonTypeModel() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonTypeModel implements PokemonTypeModel {
  const _PokemonTypeModel({required this.name, required this.url});
  factory _PokemonTypeModel.fromJson(Map<String, dynamic> json) => _$PokemonTypeModelFromJson(json);

@override final  String name;
@override final  String url;

/// Create a copy of PokemonTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonTypeModelCopyWith<_PokemonTypeModel> get copyWith => __$PokemonTypeModelCopyWithImpl<_PokemonTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonTypeModel&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonTypeModel(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$PokemonTypeModelCopyWith<$Res> implements $PokemonTypeModelCopyWith<$Res> {
  factory _$PokemonTypeModelCopyWith(_PokemonTypeModel value, $Res Function(_PokemonTypeModel) _then) = __$PokemonTypeModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class __$PokemonTypeModelCopyWithImpl<$Res>
    implements _$PokemonTypeModelCopyWith<$Res> {
  __$PokemonTypeModelCopyWithImpl(this._self, this._then);

  final _PokemonTypeModel _self;
  final $Res Function(_PokemonTypeModel) _then;

/// Create a copy of PokemonTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,}) {
  return _then(_PokemonTypeModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PokemonStatModel {

@JsonKey(name: 'base_stat') int get baseStat; int get effort; PokemonStatInfoModel get stat;
/// Create a copy of PokemonStatModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonStatModelCopyWith<PokemonStatModel> get copyWith => _$PokemonStatModelCopyWithImpl<PokemonStatModel>(this as PokemonStatModel, _$identity);

  /// Serializes this PokemonStatModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonStatModel&&(identical(other.baseStat, baseStat) || other.baseStat == baseStat)&&(identical(other.effort, effort) || other.effort == effort)&&(identical(other.stat, stat) || other.stat == stat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseStat,effort,stat);

@override
String toString() {
  return 'PokemonStatModel(baseStat: $baseStat, effort: $effort, stat: $stat)';
}


}

/// @nodoc
abstract mixin class $PokemonStatModelCopyWith<$Res>  {
  factory $PokemonStatModelCopyWith(PokemonStatModel value, $Res Function(PokemonStatModel) _then) = _$PokemonStatModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'base_stat') int baseStat, int effort, PokemonStatInfoModel stat
});


$PokemonStatInfoModelCopyWith<$Res> get stat;

}
/// @nodoc
class _$PokemonStatModelCopyWithImpl<$Res>
    implements $PokemonStatModelCopyWith<$Res> {
  _$PokemonStatModelCopyWithImpl(this._self, this._then);

  final PokemonStatModel _self;
  final $Res Function(PokemonStatModel) _then;

/// Create a copy of PokemonStatModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseStat = null,Object? effort = null,Object? stat = null,}) {
  return _then(_self.copyWith(
baseStat: null == baseStat ? _self.baseStat : baseStat // ignore: cast_nullable_to_non_nullable
as int,effort: null == effort ? _self.effort : effort // ignore: cast_nullable_to_non_nullable
as int,stat: null == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as PokemonStatInfoModel,
  ));
}
/// Create a copy of PokemonStatModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonStatInfoModelCopyWith<$Res> get stat {
  
  return $PokemonStatInfoModelCopyWith<$Res>(_self.stat, (value) {
    return _then(_self.copyWith(stat: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonStatModel].
extension PokemonStatModelPatterns on PokemonStatModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonStatModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonStatModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonStatModel value)  $default,){
final _that = this;
switch (_that) {
case _PokemonStatModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonStatModel value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonStatModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'base_stat')  int baseStat,  int effort,  PokemonStatInfoModel stat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonStatModel() when $default != null:
return $default(_that.baseStat,_that.effort,_that.stat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'base_stat')  int baseStat,  int effort,  PokemonStatInfoModel stat)  $default,) {final _that = this;
switch (_that) {
case _PokemonStatModel():
return $default(_that.baseStat,_that.effort,_that.stat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'base_stat')  int baseStat,  int effort,  PokemonStatInfoModel stat)?  $default,) {final _that = this;
switch (_that) {
case _PokemonStatModel() when $default != null:
return $default(_that.baseStat,_that.effort,_that.stat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonStatModel implements PokemonStatModel {
  const _PokemonStatModel({@JsonKey(name: 'base_stat') required this.baseStat, required this.effort, required this.stat});
  factory _PokemonStatModel.fromJson(Map<String, dynamic> json) => _$PokemonStatModelFromJson(json);

@override@JsonKey(name: 'base_stat') final  int baseStat;
@override final  int effort;
@override final  PokemonStatInfoModel stat;

/// Create a copy of PokemonStatModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonStatModelCopyWith<_PokemonStatModel> get copyWith => __$PokemonStatModelCopyWithImpl<_PokemonStatModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonStatModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonStatModel&&(identical(other.baseStat, baseStat) || other.baseStat == baseStat)&&(identical(other.effort, effort) || other.effort == effort)&&(identical(other.stat, stat) || other.stat == stat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseStat,effort,stat);

@override
String toString() {
  return 'PokemonStatModel(baseStat: $baseStat, effort: $effort, stat: $stat)';
}


}

/// @nodoc
abstract mixin class _$PokemonStatModelCopyWith<$Res> implements $PokemonStatModelCopyWith<$Res> {
  factory _$PokemonStatModelCopyWith(_PokemonStatModel value, $Res Function(_PokemonStatModel) _then) = __$PokemonStatModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'base_stat') int baseStat, int effort, PokemonStatInfoModel stat
});


@override $PokemonStatInfoModelCopyWith<$Res> get stat;

}
/// @nodoc
class __$PokemonStatModelCopyWithImpl<$Res>
    implements _$PokemonStatModelCopyWith<$Res> {
  __$PokemonStatModelCopyWithImpl(this._self, this._then);

  final _PokemonStatModel _self;
  final $Res Function(_PokemonStatModel) _then;

/// Create a copy of PokemonStatModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseStat = null,Object? effort = null,Object? stat = null,}) {
  return _then(_PokemonStatModel(
baseStat: null == baseStat ? _self.baseStat : baseStat // ignore: cast_nullable_to_non_nullable
as int,effort: null == effort ? _self.effort : effort // ignore: cast_nullable_to_non_nullable
as int,stat: null == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as PokemonStatInfoModel,
  ));
}

/// Create a copy of PokemonStatModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonStatInfoModelCopyWith<$Res> get stat {
  
  return $PokemonStatInfoModelCopyWith<$Res>(_self.stat, (value) {
    return _then(_self.copyWith(stat: value));
  });
}
}


/// @nodoc
mixin _$PokemonStatInfoModel {

 String get name; String get url;
/// Create a copy of PokemonStatInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonStatInfoModelCopyWith<PokemonStatInfoModel> get copyWith => _$PokemonStatInfoModelCopyWithImpl<PokemonStatInfoModel>(this as PokemonStatInfoModel, _$identity);

  /// Serializes this PokemonStatInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonStatInfoModel&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonStatInfoModel(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $PokemonStatInfoModelCopyWith<$Res>  {
  factory $PokemonStatInfoModelCopyWith(PokemonStatInfoModel value, $Res Function(PokemonStatInfoModel) _then) = _$PokemonStatInfoModelCopyWithImpl;
@useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class _$PokemonStatInfoModelCopyWithImpl<$Res>
    implements $PokemonStatInfoModelCopyWith<$Res> {
  _$PokemonStatInfoModelCopyWithImpl(this._self, this._then);

  final PokemonStatInfoModel _self;
  final $Res Function(PokemonStatInfoModel) _then;

/// Create a copy of PokemonStatInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonStatInfoModel].
extension PokemonStatInfoModelPatterns on PokemonStatInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonStatInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonStatInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonStatInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _PokemonStatInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonStatInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonStatInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonStatInfoModel() when $default != null:
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String url)  $default,) {final _that = this;
switch (_that) {
case _PokemonStatInfoModel():
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String url)?  $default,) {final _that = this;
switch (_that) {
case _PokemonStatInfoModel() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonStatInfoModel implements PokemonStatInfoModel {
  const _PokemonStatInfoModel({required this.name, required this.url});
  factory _PokemonStatInfoModel.fromJson(Map<String, dynamic> json) => _$PokemonStatInfoModelFromJson(json);

@override final  String name;
@override final  String url;

/// Create a copy of PokemonStatInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonStatInfoModelCopyWith<_PokemonStatInfoModel> get copyWith => __$PokemonStatInfoModelCopyWithImpl<_PokemonStatInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonStatInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonStatInfoModel&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonStatInfoModel(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$PokemonStatInfoModelCopyWith<$Res> implements $PokemonStatInfoModelCopyWith<$Res> {
  factory _$PokemonStatInfoModelCopyWith(_PokemonStatInfoModel value, $Res Function(_PokemonStatInfoModel) _then) = __$PokemonStatInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class __$PokemonStatInfoModelCopyWithImpl<$Res>
    implements _$PokemonStatInfoModelCopyWith<$Res> {
  __$PokemonStatInfoModelCopyWithImpl(this._self, this._then);

  final _PokemonStatInfoModel _self;
  final $Res Function(_PokemonStatInfoModel) _then;

/// Create a copy of PokemonStatInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,}) {
  return _then(_PokemonStatInfoModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PokemonAbilitySlotModel {

@JsonKey(name: 'is_hidden') bool get isHidden; int get slot; PokemonAbilityInfoModel get ability;
/// Create a copy of PokemonAbilitySlotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonAbilitySlotModelCopyWith<PokemonAbilitySlotModel> get copyWith => _$PokemonAbilitySlotModelCopyWithImpl<PokemonAbilitySlotModel>(this as PokemonAbilitySlotModel, _$identity);

  /// Serializes this PokemonAbilitySlotModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonAbilitySlotModel&&(identical(other.isHidden, isHidden) || other.isHidden == isHidden)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.ability, ability) || other.ability == ability));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isHidden,slot,ability);

@override
String toString() {
  return 'PokemonAbilitySlotModel(isHidden: $isHidden, slot: $slot, ability: $ability)';
}


}

/// @nodoc
abstract mixin class $PokemonAbilitySlotModelCopyWith<$Res>  {
  factory $PokemonAbilitySlotModelCopyWith(PokemonAbilitySlotModel value, $Res Function(PokemonAbilitySlotModel) _then) = _$PokemonAbilitySlotModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_hidden') bool isHidden, int slot, PokemonAbilityInfoModel ability
});


$PokemonAbilityInfoModelCopyWith<$Res> get ability;

}
/// @nodoc
class _$PokemonAbilitySlotModelCopyWithImpl<$Res>
    implements $PokemonAbilitySlotModelCopyWith<$Res> {
  _$PokemonAbilitySlotModelCopyWithImpl(this._self, this._then);

  final PokemonAbilitySlotModel _self;
  final $Res Function(PokemonAbilitySlotModel) _then;

/// Create a copy of PokemonAbilitySlotModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isHidden = null,Object? slot = null,Object? ability = null,}) {
  return _then(_self.copyWith(
isHidden: null == isHidden ? _self.isHidden : isHidden // ignore: cast_nullable_to_non_nullable
as bool,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,ability: null == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as PokemonAbilityInfoModel,
  ));
}
/// Create a copy of PokemonAbilitySlotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonAbilityInfoModelCopyWith<$Res> get ability {
  
  return $PokemonAbilityInfoModelCopyWith<$Res>(_self.ability, (value) {
    return _then(_self.copyWith(ability: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonAbilitySlotModel].
extension PokemonAbilitySlotModelPatterns on PokemonAbilitySlotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonAbilitySlotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonAbilitySlotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonAbilitySlotModel value)  $default,){
final _that = this;
switch (_that) {
case _PokemonAbilitySlotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonAbilitySlotModel value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonAbilitySlotModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_hidden')  bool isHidden,  int slot,  PokemonAbilityInfoModel ability)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonAbilitySlotModel() when $default != null:
return $default(_that.isHidden,_that.slot,_that.ability);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_hidden')  bool isHidden,  int slot,  PokemonAbilityInfoModel ability)  $default,) {final _that = this;
switch (_that) {
case _PokemonAbilitySlotModel():
return $default(_that.isHidden,_that.slot,_that.ability);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_hidden')  bool isHidden,  int slot,  PokemonAbilityInfoModel ability)?  $default,) {final _that = this;
switch (_that) {
case _PokemonAbilitySlotModel() when $default != null:
return $default(_that.isHidden,_that.slot,_that.ability);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonAbilitySlotModel implements PokemonAbilitySlotModel {
  const _PokemonAbilitySlotModel({@JsonKey(name: 'is_hidden') required this.isHidden, required this.slot, required this.ability});
  factory _PokemonAbilitySlotModel.fromJson(Map<String, dynamic> json) => _$PokemonAbilitySlotModelFromJson(json);

@override@JsonKey(name: 'is_hidden') final  bool isHidden;
@override final  int slot;
@override final  PokemonAbilityInfoModel ability;

/// Create a copy of PokemonAbilitySlotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonAbilitySlotModelCopyWith<_PokemonAbilitySlotModel> get copyWith => __$PokemonAbilitySlotModelCopyWithImpl<_PokemonAbilitySlotModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonAbilitySlotModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonAbilitySlotModel&&(identical(other.isHidden, isHidden) || other.isHidden == isHidden)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.ability, ability) || other.ability == ability));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isHidden,slot,ability);

@override
String toString() {
  return 'PokemonAbilitySlotModel(isHidden: $isHidden, slot: $slot, ability: $ability)';
}


}

/// @nodoc
abstract mixin class _$PokemonAbilitySlotModelCopyWith<$Res> implements $PokemonAbilitySlotModelCopyWith<$Res> {
  factory _$PokemonAbilitySlotModelCopyWith(_PokemonAbilitySlotModel value, $Res Function(_PokemonAbilitySlotModel) _then) = __$PokemonAbilitySlotModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_hidden') bool isHidden, int slot, PokemonAbilityInfoModel ability
});


@override $PokemonAbilityInfoModelCopyWith<$Res> get ability;

}
/// @nodoc
class __$PokemonAbilitySlotModelCopyWithImpl<$Res>
    implements _$PokemonAbilitySlotModelCopyWith<$Res> {
  __$PokemonAbilitySlotModelCopyWithImpl(this._self, this._then);

  final _PokemonAbilitySlotModel _self;
  final $Res Function(_PokemonAbilitySlotModel) _then;

/// Create a copy of PokemonAbilitySlotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isHidden = null,Object? slot = null,Object? ability = null,}) {
  return _then(_PokemonAbilitySlotModel(
isHidden: null == isHidden ? _self.isHidden : isHidden // ignore: cast_nullable_to_non_nullable
as bool,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,ability: null == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as PokemonAbilityInfoModel,
  ));
}

/// Create a copy of PokemonAbilitySlotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonAbilityInfoModelCopyWith<$Res> get ability {
  
  return $PokemonAbilityInfoModelCopyWith<$Res>(_self.ability, (value) {
    return _then(_self.copyWith(ability: value));
  });
}
}


/// @nodoc
mixin _$PokemonAbilityInfoModel {

 String get name; String get url;
/// Create a copy of PokemonAbilityInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonAbilityInfoModelCopyWith<PokemonAbilityInfoModel> get copyWith => _$PokemonAbilityInfoModelCopyWithImpl<PokemonAbilityInfoModel>(this as PokemonAbilityInfoModel, _$identity);

  /// Serializes this PokemonAbilityInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonAbilityInfoModel&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonAbilityInfoModel(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $PokemonAbilityInfoModelCopyWith<$Res>  {
  factory $PokemonAbilityInfoModelCopyWith(PokemonAbilityInfoModel value, $Res Function(PokemonAbilityInfoModel) _then) = _$PokemonAbilityInfoModelCopyWithImpl;
@useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class _$PokemonAbilityInfoModelCopyWithImpl<$Res>
    implements $PokemonAbilityInfoModelCopyWith<$Res> {
  _$PokemonAbilityInfoModelCopyWithImpl(this._self, this._then);

  final PokemonAbilityInfoModel _self;
  final $Res Function(PokemonAbilityInfoModel) _then;

/// Create a copy of PokemonAbilityInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonAbilityInfoModel].
extension PokemonAbilityInfoModelPatterns on PokemonAbilityInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonAbilityInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonAbilityInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonAbilityInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _PokemonAbilityInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonAbilityInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonAbilityInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonAbilityInfoModel() when $default != null:
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String url)  $default,) {final _that = this;
switch (_that) {
case _PokemonAbilityInfoModel():
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String url)?  $default,) {final _that = this;
switch (_that) {
case _PokemonAbilityInfoModel() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonAbilityInfoModel implements PokemonAbilityInfoModel {
  const _PokemonAbilityInfoModel({required this.name, required this.url});
  factory _PokemonAbilityInfoModel.fromJson(Map<String, dynamic> json) => _$PokemonAbilityInfoModelFromJson(json);

@override final  String name;
@override final  String url;

/// Create a copy of PokemonAbilityInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonAbilityInfoModelCopyWith<_PokemonAbilityInfoModel> get copyWith => __$PokemonAbilityInfoModelCopyWithImpl<_PokemonAbilityInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonAbilityInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonAbilityInfoModel&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonAbilityInfoModel(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$PokemonAbilityInfoModelCopyWith<$Res> implements $PokemonAbilityInfoModelCopyWith<$Res> {
  factory _$PokemonAbilityInfoModelCopyWith(_PokemonAbilityInfoModel value, $Res Function(_PokemonAbilityInfoModel) _then) = __$PokemonAbilityInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class __$PokemonAbilityInfoModelCopyWithImpl<$Res>
    implements _$PokemonAbilityInfoModelCopyWith<$Res> {
  __$PokemonAbilityInfoModelCopyWithImpl(this._self, this._then);

  final _PokemonAbilityInfoModel _self;
  final $Res Function(_PokemonAbilityInfoModel) _then;

/// Create a copy of PokemonAbilityInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,}) {
  return _then(_PokemonAbilityInfoModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PokemonSpritesModel {

@JsonKey(name: 'front_default') String? get frontDefault;@JsonKey(name: 'front_shiny') String? get frontShiny; PokemonOtherSpritesModel? get other;
/// Create a copy of PokemonSpritesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonSpritesModelCopyWith<PokemonSpritesModel> get copyWith => _$PokemonSpritesModelCopyWithImpl<PokemonSpritesModel>(this as PokemonSpritesModel, _$identity);

  /// Serializes this PokemonSpritesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonSpritesModel&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault)&&(identical(other.frontShiny, frontShiny) || other.frontShiny == frontShiny)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frontDefault,frontShiny,other);

@override
String toString() {
  return 'PokemonSpritesModel(frontDefault: $frontDefault, frontShiny: $frontShiny, other: $other)';
}


}

/// @nodoc
abstract mixin class $PokemonSpritesModelCopyWith<$Res>  {
  factory $PokemonSpritesModelCopyWith(PokemonSpritesModel value, $Res Function(PokemonSpritesModel) _then) = _$PokemonSpritesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'front_default') String? frontDefault,@JsonKey(name: 'front_shiny') String? frontShiny, PokemonOtherSpritesModel? other
});


$PokemonOtherSpritesModelCopyWith<$Res>? get other;

}
/// @nodoc
class _$PokemonSpritesModelCopyWithImpl<$Res>
    implements $PokemonSpritesModelCopyWith<$Res> {
  _$PokemonSpritesModelCopyWithImpl(this._self, this._then);

  final PokemonSpritesModel _self;
  final $Res Function(PokemonSpritesModel) _then;

/// Create a copy of PokemonSpritesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frontDefault = freezed,Object? frontShiny = freezed,Object? other = freezed,}) {
  return _then(_self.copyWith(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,frontShiny: freezed == frontShiny ? _self.frontShiny : frontShiny // ignore: cast_nullable_to_non_nullable
as String?,other: freezed == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as PokemonOtherSpritesModel?,
  ));
}
/// Create a copy of PokemonSpritesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonOtherSpritesModelCopyWith<$Res>? get other {
    if (_self.other == null) {
    return null;
  }

  return $PokemonOtherSpritesModelCopyWith<$Res>(_self.other!, (value) {
    return _then(_self.copyWith(other: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonSpritesModel].
extension PokemonSpritesModelPatterns on PokemonSpritesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonSpritesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonSpritesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonSpritesModel value)  $default,){
final _that = this;
switch (_that) {
case _PokemonSpritesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonSpritesModel value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonSpritesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'front_default')  String? frontDefault, @JsonKey(name: 'front_shiny')  String? frontShiny,  PokemonOtherSpritesModel? other)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonSpritesModel() when $default != null:
return $default(_that.frontDefault,_that.frontShiny,_that.other);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'front_default')  String? frontDefault, @JsonKey(name: 'front_shiny')  String? frontShiny,  PokemonOtherSpritesModel? other)  $default,) {final _that = this;
switch (_that) {
case _PokemonSpritesModel():
return $default(_that.frontDefault,_that.frontShiny,_that.other);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'front_default')  String? frontDefault, @JsonKey(name: 'front_shiny')  String? frontShiny,  PokemonOtherSpritesModel? other)?  $default,) {final _that = this;
switch (_that) {
case _PokemonSpritesModel() when $default != null:
return $default(_that.frontDefault,_that.frontShiny,_that.other);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonSpritesModel implements PokemonSpritesModel {
  const _PokemonSpritesModel({@JsonKey(name: 'front_default') this.frontDefault, @JsonKey(name: 'front_shiny') this.frontShiny, this.other});
  factory _PokemonSpritesModel.fromJson(Map<String, dynamic> json) => _$PokemonSpritesModelFromJson(json);

@override@JsonKey(name: 'front_default') final  String? frontDefault;
@override@JsonKey(name: 'front_shiny') final  String? frontShiny;
@override final  PokemonOtherSpritesModel? other;

/// Create a copy of PokemonSpritesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonSpritesModelCopyWith<_PokemonSpritesModel> get copyWith => __$PokemonSpritesModelCopyWithImpl<_PokemonSpritesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonSpritesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonSpritesModel&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault)&&(identical(other.frontShiny, frontShiny) || other.frontShiny == frontShiny)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frontDefault,frontShiny,other);

@override
String toString() {
  return 'PokemonSpritesModel(frontDefault: $frontDefault, frontShiny: $frontShiny, other: $other)';
}


}

/// @nodoc
abstract mixin class _$PokemonSpritesModelCopyWith<$Res> implements $PokemonSpritesModelCopyWith<$Res> {
  factory _$PokemonSpritesModelCopyWith(_PokemonSpritesModel value, $Res Function(_PokemonSpritesModel) _then) = __$PokemonSpritesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'front_default') String? frontDefault,@JsonKey(name: 'front_shiny') String? frontShiny, PokemonOtherSpritesModel? other
});


@override $PokemonOtherSpritesModelCopyWith<$Res>? get other;

}
/// @nodoc
class __$PokemonSpritesModelCopyWithImpl<$Res>
    implements _$PokemonSpritesModelCopyWith<$Res> {
  __$PokemonSpritesModelCopyWithImpl(this._self, this._then);

  final _PokemonSpritesModel _self;
  final $Res Function(_PokemonSpritesModel) _then;

/// Create a copy of PokemonSpritesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frontDefault = freezed,Object? frontShiny = freezed,Object? other = freezed,}) {
  return _then(_PokemonSpritesModel(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,frontShiny: freezed == frontShiny ? _self.frontShiny : frontShiny // ignore: cast_nullable_to_non_nullable
as String?,other: freezed == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as PokemonOtherSpritesModel?,
  ));
}

/// Create a copy of PokemonSpritesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonOtherSpritesModelCopyWith<$Res>? get other {
    if (_self.other == null) {
    return null;
  }

  return $PokemonOtherSpritesModelCopyWith<$Res>(_self.other!, (value) {
    return _then(_self.copyWith(other: value));
  });
}
}


/// @nodoc
mixin _$PokemonOtherSpritesModel {

@JsonKey(name: 'official-artwork') PokemonOfficialArtworkModel? get officialArtwork;
/// Create a copy of PokemonOtherSpritesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonOtherSpritesModelCopyWith<PokemonOtherSpritesModel> get copyWith => _$PokemonOtherSpritesModelCopyWithImpl<PokemonOtherSpritesModel>(this as PokemonOtherSpritesModel, _$identity);

  /// Serializes this PokemonOtherSpritesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonOtherSpritesModel&&(identical(other.officialArtwork, officialArtwork) || other.officialArtwork == officialArtwork));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,officialArtwork);

@override
String toString() {
  return 'PokemonOtherSpritesModel(officialArtwork: $officialArtwork)';
}


}

/// @nodoc
abstract mixin class $PokemonOtherSpritesModelCopyWith<$Res>  {
  factory $PokemonOtherSpritesModelCopyWith(PokemonOtherSpritesModel value, $Res Function(PokemonOtherSpritesModel) _then) = _$PokemonOtherSpritesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'official-artwork') PokemonOfficialArtworkModel? officialArtwork
});


$PokemonOfficialArtworkModelCopyWith<$Res>? get officialArtwork;

}
/// @nodoc
class _$PokemonOtherSpritesModelCopyWithImpl<$Res>
    implements $PokemonOtherSpritesModelCopyWith<$Res> {
  _$PokemonOtherSpritesModelCopyWithImpl(this._self, this._then);

  final PokemonOtherSpritesModel _self;
  final $Res Function(PokemonOtherSpritesModel) _then;

/// Create a copy of PokemonOtherSpritesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? officialArtwork = freezed,}) {
  return _then(_self.copyWith(
officialArtwork: freezed == officialArtwork ? _self.officialArtwork : officialArtwork // ignore: cast_nullable_to_non_nullable
as PokemonOfficialArtworkModel?,
  ));
}
/// Create a copy of PokemonOtherSpritesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonOfficialArtworkModelCopyWith<$Res>? get officialArtwork {
    if (_self.officialArtwork == null) {
    return null;
  }

  return $PokemonOfficialArtworkModelCopyWith<$Res>(_self.officialArtwork!, (value) {
    return _then(_self.copyWith(officialArtwork: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonOtherSpritesModel].
extension PokemonOtherSpritesModelPatterns on PokemonOtherSpritesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonOtherSpritesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonOtherSpritesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonOtherSpritesModel value)  $default,){
final _that = this;
switch (_that) {
case _PokemonOtherSpritesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonOtherSpritesModel value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonOtherSpritesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'official-artwork')  PokemonOfficialArtworkModel? officialArtwork)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonOtherSpritesModel() when $default != null:
return $default(_that.officialArtwork);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'official-artwork')  PokemonOfficialArtworkModel? officialArtwork)  $default,) {final _that = this;
switch (_that) {
case _PokemonOtherSpritesModel():
return $default(_that.officialArtwork);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'official-artwork')  PokemonOfficialArtworkModel? officialArtwork)?  $default,) {final _that = this;
switch (_that) {
case _PokemonOtherSpritesModel() when $default != null:
return $default(_that.officialArtwork);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonOtherSpritesModel implements PokemonOtherSpritesModel {
  const _PokemonOtherSpritesModel({@JsonKey(name: 'official-artwork') this.officialArtwork});
  factory _PokemonOtherSpritesModel.fromJson(Map<String, dynamic> json) => _$PokemonOtherSpritesModelFromJson(json);

@override@JsonKey(name: 'official-artwork') final  PokemonOfficialArtworkModel? officialArtwork;

/// Create a copy of PokemonOtherSpritesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonOtherSpritesModelCopyWith<_PokemonOtherSpritesModel> get copyWith => __$PokemonOtherSpritesModelCopyWithImpl<_PokemonOtherSpritesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonOtherSpritesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonOtherSpritesModel&&(identical(other.officialArtwork, officialArtwork) || other.officialArtwork == officialArtwork));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,officialArtwork);

@override
String toString() {
  return 'PokemonOtherSpritesModel(officialArtwork: $officialArtwork)';
}


}

/// @nodoc
abstract mixin class _$PokemonOtherSpritesModelCopyWith<$Res> implements $PokemonOtherSpritesModelCopyWith<$Res> {
  factory _$PokemonOtherSpritesModelCopyWith(_PokemonOtherSpritesModel value, $Res Function(_PokemonOtherSpritesModel) _then) = __$PokemonOtherSpritesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'official-artwork') PokemonOfficialArtworkModel? officialArtwork
});


@override $PokemonOfficialArtworkModelCopyWith<$Res>? get officialArtwork;

}
/// @nodoc
class __$PokemonOtherSpritesModelCopyWithImpl<$Res>
    implements _$PokemonOtherSpritesModelCopyWith<$Res> {
  __$PokemonOtherSpritesModelCopyWithImpl(this._self, this._then);

  final _PokemonOtherSpritesModel _self;
  final $Res Function(_PokemonOtherSpritesModel) _then;

/// Create a copy of PokemonOtherSpritesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? officialArtwork = freezed,}) {
  return _then(_PokemonOtherSpritesModel(
officialArtwork: freezed == officialArtwork ? _self.officialArtwork : officialArtwork // ignore: cast_nullable_to_non_nullable
as PokemonOfficialArtworkModel?,
  ));
}

/// Create a copy of PokemonOtherSpritesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonOfficialArtworkModelCopyWith<$Res>? get officialArtwork {
    if (_self.officialArtwork == null) {
    return null;
  }

  return $PokemonOfficialArtworkModelCopyWith<$Res>(_self.officialArtwork!, (value) {
    return _then(_self.copyWith(officialArtwork: value));
  });
}
}


/// @nodoc
mixin _$PokemonOfficialArtworkModel {

@JsonKey(name: 'front_default') String? get frontDefault;@JsonKey(name: 'front_shiny') String? get frontShiny;
/// Create a copy of PokemonOfficialArtworkModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonOfficialArtworkModelCopyWith<PokemonOfficialArtworkModel> get copyWith => _$PokemonOfficialArtworkModelCopyWithImpl<PokemonOfficialArtworkModel>(this as PokemonOfficialArtworkModel, _$identity);

  /// Serializes this PokemonOfficialArtworkModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonOfficialArtworkModel&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault)&&(identical(other.frontShiny, frontShiny) || other.frontShiny == frontShiny));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frontDefault,frontShiny);

@override
String toString() {
  return 'PokemonOfficialArtworkModel(frontDefault: $frontDefault, frontShiny: $frontShiny)';
}


}

/// @nodoc
abstract mixin class $PokemonOfficialArtworkModelCopyWith<$Res>  {
  factory $PokemonOfficialArtworkModelCopyWith(PokemonOfficialArtworkModel value, $Res Function(PokemonOfficialArtworkModel) _then) = _$PokemonOfficialArtworkModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'front_default') String? frontDefault,@JsonKey(name: 'front_shiny') String? frontShiny
});




}
/// @nodoc
class _$PokemonOfficialArtworkModelCopyWithImpl<$Res>
    implements $PokemonOfficialArtworkModelCopyWith<$Res> {
  _$PokemonOfficialArtworkModelCopyWithImpl(this._self, this._then);

  final PokemonOfficialArtworkModel _self;
  final $Res Function(PokemonOfficialArtworkModel) _then;

/// Create a copy of PokemonOfficialArtworkModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frontDefault = freezed,Object? frontShiny = freezed,}) {
  return _then(_self.copyWith(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,frontShiny: freezed == frontShiny ? _self.frontShiny : frontShiny // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonOfficialArtworkModel].
extension PokemonOfficialArtworkModelPatterns on PokemonOfficialArtworkModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonOfficialArtworkModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonOfficialArtworkModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonOfficialArtworkModel value)  $default,){
final _that = this;
switch (_that) {
case _PokemonOfficialArtworkModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonOfficialArtworkModel value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonOfficialArtworkModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'front_default')  String? frontDefault, @JsonKey(name: 'front_shiny')  String? frontShiny)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonOfficialArtworkModel() when $default != null:
return $default(_that.frontDefault,_that.frontShiny);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'front_default')  String? frontDefault, @JsonKey(name: 'front_shiny')  String? frontShiny)  $default,) {final _that = this;
switch (_that) {
case _PokemonOfficialArtworkModel():
return $default(_that.frontDefault,_that.frontShiny);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'front_default')  String? frontDefault, @JsonKey(name: 'front_shiny')  String? frontShiny)?  $default,) {final _that = this;
switch (_that) {
case _PokemonOfficialArtworkModel() when $default != null:
return $default(_that.frontDefault,_that.frontShiny);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonOfficialArtworkModel implements PokemonOfficialArtworkModel {
  const _PokemonOfficialArtworkModel({@JsonKey(name: 'front_default') this.frontDefault, @JsonKey(name: 'front_shiny') this.frontShiny});
  factory _PokemonOfficialArtworkModel.fromJson(Map<String, dynamic> json) => _$PokemonOfficialArtworkModelFromJson(json);

@override@JsonKey(name: 'front_default') final  String? frontDefault;
@override@JsonKey(name: 'front_shiny') final  String? frontShiny;

/// Create a copy of PokemonOfficialArtworkModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonOfficialArtworkModelCopyWith<_PokemonOfficialArtworkModel> get copyWith => __$PokemonOfficialArtworkModelCopyWithImpl<_PokemonOfficialArtworkModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonOfficialArtworkModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonOfficialArtworkModel&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault)&&(identical(other.frontShiny, frontShiny) || other.frontShiny == frontShiny));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frontDefault,frontShiny);

@override
String toString() {
  return 'PokemonOfficialArtworkModel(frontDefault: $frontDefault, frontShiny: $frontShiny)';
}


}

/// @nodoc
abstract mixin class _$PokemonOfficialArtworkModelCopyWith<$Res> implements $PokemonOfficialArtworkModelCopyWith<$Res> {
  factory _$PokemonOfficialArtworkModelCopyWith(_PokemonOfficialArtworkModel value, $Res Function(_PokemonOfficialArtworkModel) _then) = __$PokemonOfficialArtworkModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'front_default') String? frontDefault,@JsonKey(name: 'front_shiny') String? frontShiny
});




}
/// @nodoc
class __$PokemonOfficialArtworkModelCopyWithImpl<$Res>
    implements _$PokemonOfficialArtworkModelCopyWith<$Res> {
  __$PokemonOfficialArtworkModelCopyWithImpl(this._self, this._then);

  final _PokemonOfficialArtworkModel _self;
  final $Res Function(_PokemonOfficialArtworkModel) _then;

/// Create a copy of PokemonOfficialArtworkModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frontDefault = freezed,Object? frontShiny = freezed,}) {
  return _then(_PokemonOfficialArtworkModel(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,frontShiny: freezed == frontShiny ? _self.frontShiny : frontShiny // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
