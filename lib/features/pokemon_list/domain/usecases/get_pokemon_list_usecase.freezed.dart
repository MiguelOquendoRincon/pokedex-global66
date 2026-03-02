// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_pokemon_list_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetPokemonListParams {

 int get limit; int get offset;
/// Create a copy of GetPokemonListParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPokemonListParamsCopyWith<GetPokemonListParams> get copyWith => _$GetPokemonListParamsCopyWithImpl<GetPokemonListParams>(this as GetPokemonListParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPokemonListParams&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}


@override
int get hashCode => Object.hash(runtimeType,limit,offset);

@override
String toString() {
  return 'GetPokemonListParams(limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $GetPokemonListParamsCopyWith<$Res>  {
  factory $GetPokemonListParamsCopyWith(GetPokemonListParams value, $Res Function(GetPokemonListParams) _then) = _$GetPokemonListParamsCopyWithImpl;
@useResult
$Res call({
 int limit, int offset
});




}
/// @nodoc
class _$GetPokemonListParamsCopyWithImpl<$Res>
    implements $GetPokemonListParamsCopyWith<$Res> {
  _$GetPokemonListParamsCopyWithImpl(this._self, this._then);

  final GetPokemonListParams _self;
  final $Res Function(GetPokemonListParams) _then;

/// Create a copy of GetPokemonListParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? offset = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GetPokemonListParams].
extension GetPokemonListParamsPatterns on GetPokemonListParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetPokemonListParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPokemonListParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetPokemonListParams value)  $default,){
final _that = this;
switch (_that) {
case _GetPokemonListParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetPokemonListParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetPokemonListParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPokemonListParams() when $default != null:
return $default(_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  int offset)  $default,) {final _that = this;
switch (_that) {
case _GetPokemonListParams():
return $default(_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  int offset)?  $default,) {final _that = this;
switch (_that) {
case _GetPokemonListParams() when $default != null:
return $default(_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc


class _GetPokemonListParams implements GetPokemonListParams {
  const _GetPokemonListParams({this.limit = ApiConstants.defaultPageLimit, this.offset = 0});
  

@override@JsonKey() final  int limit;
@override@JsonKey() final  int offset;

/// Create a copy of GetPokemonListParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPokemonListParamsCopyWith<_GetPokemonListParams> get copyWith => __$GetPokemonListParamsCopyWithImpl<_GetPokemonListParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPokemonListParams&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}


@override
int get hashCode => Object.hash(runtimeType,limit,offset);

@override
String toString() {
  return 'GetPokemonListParams(limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$GetPokemonListParamsCopyWith<$Res> implements $GetPokemonListParamsCopyWith<$Res> {
  factory _$GetPokemonListParamsCopyWith(_GetPokemonListParams value, $Res Function(_GetPokemonListParams) _then) = __$GetPokemonListParamsCopyWithImpl;
@override @useResult
$Res call({
 int limit, int offset
});




}
/// @nodoc
class __$GetPokemonListParamsCopyWithImpl<$Res>
    implements _$GetPokemonListParamsCopyWith<$Res> {
  __$GetPokemonListParamsCopyWithImpl(this._self, this._then);

  final _GetPokemonListParams _self;
  final $Res Function(_GetPokemonListParams) _then;

/// Create a copy of GetPokemonListParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? offset = null,}) {
  return _then(_GetPokemonListParams(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
