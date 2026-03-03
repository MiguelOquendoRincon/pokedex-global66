// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PokemonListState {

 List<PokemonSummary> get allPokemon; String get searchQuery; String get selectedType;// '' = no type filter
 bool get isLoadingMore; bool get hasReachedEnd; AppException? get error;
/// Create a copy of PokemonListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonListStateCopyWith<PokemonListState> get copyWith => _$PokemonListStateCopyWithImpl<PokemonListState>(this as PokemonListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonListState&&const DeepCollectionEquality().equals(other.allPokemon, allPokemon)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(allPokemon),searchQuery,selectedType,isLoadingMore,hasReachedEnd,error);

@override
String toString() {
  return 'PokemonListState(allPokemon: $allPokemon, searchQuery: $searchQuery, selectedType: $selectedType, isLoadingMore: $isLoadingMore, hasReachedEnd: $hasReachedEnd, error: $error)';
}


}

/// @nodoc
abstract mixin class $PokemonListStateCopyWith<$Res>  {
  factory $PokemonListStateCopyWith(PokemonListState value, $Res Function(PokemonListState) _then) = _$PokemonListStateCopyWithImpl;
@useResult
$Res call({
 List<PokemonSummary> allPokemon, String searchQuery, String selectedType, bool isLoadingMore, bool hasReachedEnd, AppException? error
});


$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$PokemonListStateCopyWithImpl<$Res>
    implements $PokemonListStateCopyWith<$Res> {
  _$PokemonListStateCopyWithImpl(this._self, this._then);

  final PokemonListState _self;
  final $Res Function(PokemonListState) _then;

/// Create a copy of PokemonListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allPokemon = null,Object? searchQuery = null,Object? selectedType = null,Object? isLoadingMore = null,Object? hasReachedEnd = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
allPokemon: null == allPokemon ? _self.allPokemon : allPokemon // ignore: cast_nullable_to_non_nullable
as List<PokemonSummary>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as String,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of PokemonListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonListState].
extension PokemonListStatePatterns on PokemonListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonListState value)  $default,){
final _that = this;
switch (_that) {
case _PokemonListState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonListState value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PokemonSummary> allPokemon,  String searchQuery,  String selectedType,  bool isLoadingMore,  bool hasReachedEnd,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonListState() when $default != null:
return $default(_that.allPokemon,_that.searchQuery,_that.selectedType,_that.isLoadingMore,_that.hasReachedEnd,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PokemonSummary> allPokemon,  String searchQuery,  String selectedType,  bool isLoadingMore,  bool hasReachedEnd,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _PokemonListState():
return $default(_that.allPokemon,_that.searchQuery,_that.selectedType,_that.isLoadingMore,_that.hasReachedEnd,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PokemonSummary> allPokemon,  String searchQuery,  String selectedType,  bool isLoadingMore,  bool hasReachedEnd,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _PokemonListState() when $default != null:
return $default(_that.allPokemon,_that.searchQuery,_that.selectedType,_that.isLoadingMore,_that.hasReachedEnd,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PokemonListState extends PokemonListState {
  const _PokemonListState({final  List<PokemonSummary> allPokemon = const [], this.searchQuery = '', this.selectedType = '', this.isLoadingMore = false, this.hasReachedEnd = false, this.error}): _allPokemon = allPokemon,super._();
  

 final  List<PokemonSummary> _allPokemon;
@override@JsonKey() List<PokemonSummary> get allPokemon {
  if (_allPokemon is EqualUnmodifiableListView) return _allPokemon;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allPokemon);
}

@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  String selectedType;
// '' = no type filter
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasReachedEnd;
@override final  AppException? error;

/// Create a copy of PokemonListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonListStateCopyWith<_PokemonListState> get copyWith => __$PokemonListStateCopyWithImpl<_PokemonListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonListState&&const DeepCollectionEquality().equals(other._allPokemon, _allPokemon)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allPokemon),searchQuery,selectedType,isLoadingMore,hasReachedEnd,error);

@override
String toString() {
  return 'PokemonListState(allPokemon: $allPokemon, searchQuery: $searchQuery, selectedType: $selectedType, isLoadingMore: $isLoadingMore, hasReachedEnd: $hasReachedEnd, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PokemonListStateCopyWith<$Res> implements $PokemonListStateCopyWith<$Res> {
  factory _$PokemonListStateCopyWith(_PokemonListState value, $Res Function(_PokemonListState) _then) = __$PokemonListStateCopyWithImpl;
@override @useResult
$Res call({
 List<PokemonSummary> allPokemon, String searchQuery, String selectedType, bool isLoadingMore, bool hasReachedEnd, AppException? error
});


@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$PokemonListStateCopyWithImpl<$Res>
    implements _$PokemonListStateCopyWith<$Res> {
  __$PokemonListStateCopyWithImpl(this._self, this._then);

  final _PokemonListState _self;
  final $Res Function(_PokemonListState) _then;

/// Create a copy of PokemonListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allPokemon = null,Object? searchQuery = null,Object? selectedType = null,Object? isLoadingMore = null,Object? hasReachedEnd = null,Object? error = freezed,}) {
  return _then(_PokemonListState(
allPokemon: null == allPokemon ? _self._allPokemon : allPokemon // ignore: cast_nullable_to_non_nullable
as List<PokemonSummary>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as String,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of PokemonListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
