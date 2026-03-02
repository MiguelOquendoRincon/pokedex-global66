// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toggle_favorite_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ToggleFavoriteParams {

 FavoritePokemon get pokemon; List<FavoritePokemon> get currentFavorites;
/// Create a copy of ToggleFavoriteParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleFavoriteParamsCopyWith<ToggleFavoriteParams> get copyWith => _$ToggleFavoriteParamsCopyWithImpl<ToggleFavoriteParams>(this as ToggleFavoriteParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleFavoriteParams&&(identical(other.pokemon, pokemon) || other.pokemon == pokemon)&&const DeepCollectionEquality().equals(other.currentFavorites, currentFavorites));
}


@override
int get hashCode => Object.hash(runtimeType,pokemon,const DeepCollectionEquality().hash(currentFavorites));

@override
String toString() {
  return 'ToggleFavoriteParams(pokemon: $pokemon, currentFavorites: $currentFavorites)';
}


}

/// @nodoc
abstract mixin class $ToggleFavoriteParamsCopyWith<$Res>  {
  factory $ToggleFavoriteParamsCopyWith(ToggleFavoriteParams value, $Res Function(ToggleFavoriteParams) _then) = _$ToggleFavoriteParamsCopyWithImpl;
@useResult
$Res call({
 FavoritePokemon pokemon, List<FavoritePokemon> currentFavorites
});


$FavoritePokemonCopyWith<$Res> get pokemon;

}
/// @nodoc
class _$ToggleFavoriteParamsCopyWithImpl<$Res>
    implements $ToggleFavoriteParamsCopyWith<$Res> {
  _$ToggleFavoriteParamsCopyWithImpl(this._self, this._then);

  final ToggleFavoriteParams _self;
  final $Res Function(ToggleFavoriteParams) _then;

/// Create a copy of ToggleFavoriteParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pokemon = null,Object? currentFavorites = null,}) {
  return _then(_self.copyWith(
pokemon: null == pokemon ? _self.pokemon : pokemon // ignore: cast_nullable_to_non_nullable
as FavoritePokemon,currentFavorites: null == currentFavorites ? _self.currentFavorites : currentFavorites // ignore: cast_nullable_to_non_nullable
as List<FavoritePokemon>,
  ));
}
/// Create a copy of ToggleFavoriteParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FavoritePokemonCopyWith<$Res> get pokemon {
  
  return $FavoritePokemonCopyWith<$Res>(_self.pokemon, (value) {
    return _then(_self.copyWith(pokemon: value));
  });
}
}


/// Adds pattern-matching-related methods to [ToggleFavoriteParams].
extension ToggleFavoriteParamsPatterns on ToggleFavoriteParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToggleFavoriteParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToggleFavoriteParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToggleFavoriteParams value)  $default,){
final _that = this;
switch (_that) {
case _ToggleFavoriteParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToggleFavoriteParams value)?  $default,){
final _that = this;
switch (_that) {
case _ToggleFavoriteParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FavoritePokemon pokemon,  List<FavoritePokemon> currentFavorites)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToggleFavoriteParams() when $default != null:
return $default(_that.pokemon,_that.currentFavorites);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FavoritePokemon pokemon,  List<FavoritePokemon> currentFavorites)  $default,) {final _that = this;
switch (_that) {
case _ToggleFavoriteParams():
return $default(_that.pokemon,_that.currentFavorites);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FavoritePokemon pokemon,  List<FavoritePokemon> currentFavorites)?  $default,) {final _that = this;
switch (_that) {
case _ToggleFavoriteParams() when $default != null:
return $default(_that.pokemon,_that.currentFavorites);case _:
  return null;

}
}

}

/// @nodoc


class _ToggleFavoriteParams implements ToggleFavoriteParams {
  const _ToggleFavoriteParams({required this.pokemon, required final  List<FavoritePokemon> currentFavorites}): _currentFavorites = currentFavorites;
  

@override final  FavoritePokemon pokemon;
 final  List<FavoritePokemon> _currentFavorites;
@override List<FavoritePokemon> get currentFavorites {
  if (_currentFavorites is EqualUnmodifiableListView) return _currentFavorites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currentFavorites);
}


/// Create a copy of ToggleFavoriteParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleFavoriteParamsCopyWith<_ToggleFavoriteParams> get copyWith => __$ToggleFavoriteParamsCopyWithImpl<_ToggleFavoriteParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleFavoriteParams&&(identical(other.pokemon, pokemon) || other.pokemon == pokemon)&&const DeepCollectionEquality().equals(other._currentFavorites, _currentFavorites));
}


@override
int get hashCode => Object.hash(runtimeType,pokemon,const DeepCollectionEquality().hash(_currentFavorites));

@override
String toString() {
  return 'ToggleFavoriteParams(pokemon: $pokemon, currentFavorites: $currentFavorites)';
}


}

/// @nodoc
abstract mixin class _$ToggleFavoriteParamsCopyWith<$Res> implements $ToggleFavoriteParamsCopyWith<$Res> {
  factory _$ToggleFavoriteParamsCopyWith(_ToggleFavoriteParams value, $Res Function(_ToggleFavoriteParams) _then) = __$ToggleFavoriteParamsCopyWithImpl;
@override @useResult
$Res call({
 FavoritePokemon pokemon, List<FavoritePokemon> currentFavorites
});


@override $FavoritePokemonCopyWith<$Res> get pokemon;

}
/// @nodoc
class __$ToggleFavoriteParamsCopyWithImpl<$Res>
    implements _$ToggleFavoriteParamsCopyWith<$Res> {
  __$ToggleFavoriteParamsCopyWithImpl(this._self, this._then);

  final _ToggleFavoriteParams _self;
  final $Res Function(_ToggleFavoriteParams) _then;

/// Create a copy of ToggleFavoriteParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pokemon = null,Object? currentFavorites = null,}) {
  return _then(_ToggleFavoriteParams(
pokemon: null == pokemon ? _self.pokemon : pokemon // ignore: cast_nullable_to_non_nullable
as FavoritePokemon,currentFavorites: null == currentFavorites ? _self._currentFavorites : currentFavorites // ignore: cast_nullable_to_non_nullable
as List<FavoritePokemon>,
  ));
}

/// Create a copy of ToggleFavoriteParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FavoritePokemonCopyWith<$Res> get pokemon {
  
  return $FavoritePokemonCopyWith<$Res>(_self.pokemon, (value) {
    return _then(_self.copyWith(pokemon: value));
  });
}
}

// dart format on
