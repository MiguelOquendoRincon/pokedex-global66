// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_pokemon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoritePokemon {

 int get id; String get name; String get primaryType;
/// Create a copy of FavoritePokemon
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoritePokemonCopyWith<FavoritePokemon> get copyWith => _$FavoritePokemonCopyWithImpl<FavoritePokemon>(this as FavoritePokemon, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritePokemon&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.primaryType, primaryType) || other.primaryType == primaryType));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,primaryType);

@override
String toString() {
  return 'FavoritePokemon(id: $id, name: $name, primaryType: $primaryType)';
}


}

/// @nodoc
abstract mixin class $FavoritePokemonCopyWith<$Res>  {
  factory $FavoritePokemonCopyWith(FavoritePokemon value, $Res Function(FavoritePokemon) _then) = _$FavoritePokemonCopyWithImpl;
@useResult
$Res call({
 int id, String name, String primaryType
});




}
/// @nodoc
class _$FavoritePokemonCopyWithImpl<$Res>
    implements $FavoritePokemonCopyWith<$Res> {
  _$FavoritePokemonCopyWithImpl(this._self, this._then);

  final FavoritePokemon _self;
  final $Res Function(FavoritePokemon) _then;

/// Create a copy of FavoritePokemon
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? primaryType = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,primaryType: null == primaryType ? _self.primaryType : primaryType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoritePokemon].
extension FavoritePokemonPatterns on FavoritePokemon {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoritePokemon value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoritePokemon() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoritePokemon value)  $default,){
final _that = this;
switch (_that) {
case _FavoritePokemon():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoritePokemon value)?  $default,){
final _that = this;
switch (_that) {
case _FavoritePokemon() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String primaryType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoritePokemon() when $default != null:
return $default(_that.id,_that.name,_that.primaryType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String primaryType)  $default,) {final _that = this;
switch (_that) {
case _FavoritePokemon():
return $default(_that.id,_that.name,_that.primaryType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String primaryType)?  $default,) {final _that = this;
switch (_that) {
case _FavoritePokemon() when $default != null:
return $default(_that.id,_that.name,_that.primaryType);case _:
  return null;

}
}

}

/// @nodoc


class _FavoritePokemon extends FavoritePokemon {
  const _FavoritePokemon({required this.id, required this.name, required this.primaryType}): super._();
  

@override final  int id;
@override final  String name;
@override final  String primaryType;

/// Create a copy of FavoritePokemon
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoritePokemonCopyWith<_FavoritePokemon> get copyWith => __$FavoritePokemonCopyWithImpl<_FavoritePokemon>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoritePokemon&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.primaryType, primaryType) || other.primaryType == primaryType));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,primaryType);

@override
String toString() {
  return 'FavoritePokemon(id: $id, name: $name, primaryType: $primaryType)';
}


}

/// @nodoc
abstract mixin class _$FavoritePokemonCopyWith<$Res> implements $FavoritePokemonCopyWith<$Res> {
  factory _$FavoritePokemonCopyWith(_FavoritePokemon value, $Res Function(_FavoritePokemon) _then) = __$FavoritePokemonCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String primaryType
});




}
/// @nodoc
class __$FavoritePokemonCopyWithImpl<$Res>
    implements _$FavoritePokemonCopyWith<$Res> {
  __$FavoritePokemonCopyWithImpl(this._self, this._then);

  final _FavoritePokemon _self;
  final $Res Function(_FavoritePokemon) _then;

/// Create a copy of FavoritePokemon
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? primaryType = null,}) {
  return _then(_FavoritePokemon(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,primaryType: null == primaryType ? _self.primaryType : primaryType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
