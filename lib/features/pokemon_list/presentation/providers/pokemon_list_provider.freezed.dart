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

/// Fully enriched previews — ready to render with color and type.
 List<PokemonPreview> get previews;/// True only while the very first page is loading.
/// Shows the full-grid skeleton.
 bool get isInitialLoading;/// True while loading pages 2, 3, … (pagination).
/// Shows a subtle bottom loader, not the full skeleton.
 bool get isLoadingMore; bool get hasReachedEnd;/// Non-null only on hard failures (first page).
 AppException? get error;/// Active name filter (search bar).
 String get searchQuery;/// Active type filter (chip row). Empty string = no filter.
 String get selectedType;
/// Create a copy of PokemonListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonListStateCopyWith<PokemonListState> get copyWith => _$PokemonListStateCopyWithImpl<PokemonListState>(this as PokemonListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonListState&&const DeepCollectionEquality().equals(other.previews, previews)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd)&&(identical(other.error, error) || other.error == error)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(previews),isInitialLoading,isLoadingMore,hasReachedEnd,error,searchQuery,selectedType);

@override
String toString() {
  return 'PokemonListState(previews: $previews, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, hasReachedEnd: $hasReachedEnd, error: $error, searchQuery: $searchQuery, selectedType: $selectedType)';
}


}

/// @nodoc
abstract mixin class $PokemonListStateCopyWith<$Res>  {
  factory $PokemonListStateCopyWith(PokemonListState value, $Res Function(PokemonListState) _then) = _$PokemonListStateCopyWithImpl;
@useResult
$Res call({
 List<PokemonPreview> previews, bool isInitialLoading, bool isLoadingMore, bool hasReachedEnd, AppException? error, String searchQuery, String selectedType
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
@pragma('vm:prefer-inline') @override $Res call({Object? previews = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? hasReachedEnd = null,Object? error = freezed,Object? searchQuery = null,Object? selectedType = null,}) {
  return _then(_self.copyWith(
previews: null == previews ? _self.previews : previews // ignore: cast_nullable_to_non_nullable
as List<PokemonPreview>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PokemonPreview> previews,  bool isInitialLoading,  bool isLoadingMore,  bool hasReachedEnd,  AppException? error,  String searchQuery,  String selectedType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonListState() when $default != null:
return $default(_that.previews,_that.isInitialLoading,_that.isLoadingMore,_that.hasReachedEnd,_that.error,_that.searchQuery,_that.selectedType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PokemonPreview> previews,  bool isInitialLoading,  bool isLoadingMore,  bool hasReachedEnd,  AppException? error,  String searchQuery,  String selectedType)  $default,) {final _that = this;
switch (_that) {
case _PokemonListState():
return $default(_that.previews,_that.isInitialLoading,_that.isLoadingMore,_that.hasReachedEnd,_that.error,_that.searchQuery,_that.selectedType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PokemonPreview> previews,  bool isInitialLoading,  bool isLoadingMore,  bool hasReachedEnd,  AppException? error,  String searchQuery,  String selectedType)?  $default,) {final _that = this;
switch (_that) {
case _PokemonListState() when $default != null:
return $default(_that.previews,_that.isInitialLoading,_that.isLoadingMore,_that.hasReachedEnd,_that.error,_that.searchQuery,_that.selectedType);case _:
  return null;

}
}

}

/// @nodoc


class _PokemonListState extends PokemonListState {
  const _PokemonListState({final  List<PokemonPreview> previews = const [], this.isInitialLoading = false, this.isLoadingMore = false, this.hasReachedEnd = false, this.error, this.searchQuery = '', this.selectedType = ''}): _previews = previews,super._();
  

/// Fully enriched previews — ready to render with color and type.
 final  List<PokemonPreview> _previews;
/// Fully enriched previews — ready to render with color and type.
@override@JsonKey() List<PokemonPreview> get previews {
  if (_previews is EqualUnmodifiableListView) return _previews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_previews);
}

/// True only while the very first page is loading.
/// Shows the full-grid skeleton.
@override@JsonKey() final  bool isInitialLoading;
/// True while loading pages 2, 3, … (pagination).
/// Shows a subtle bottom loader, not the full skeleton.
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasReachedEnd;
/// Non-null only on hard failures (first page).
@override final  AppException? error;
/// Active name filter (search bar).
@override@JsonKey() final  String searchQuery;
/// Active type filter (chip row). Empty string = no filter.
@override@JsonKey() final  String selectedType;

/// Create a copy of PokemonListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonListStateCopyWith<_PokemonListState> get copyWith => __$PokemonListStateCopyWithImpl<_PokemonListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonListState&&const DeepCollectionEquality().equals(other._previews, _previews)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd)&&(identical(other.error, error) || other.error == error)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_previews),isInitialLoading,isLoadingMore,hasReachedEnd,error,searchQuery,selectedType);

@override
String toString() {
  return 'PokemonListState(previews: $previews, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, hasReachedEnd: $hasReachedEnd, error: $error, searchQuery: $searchQuery, selectedType: $selectedType)';
}


}

/// @nodoc
abstract mixin class _$PokemonListStateCopyWith<$Res> implements $PokemonListStateCopyWith<$Res> {
  factory _$PokemonListStateCopyWith(_PokemonListState value, $Res Function(_PokemonListState) _then) = __$PokemonListStateCopyWithImpl;
@override @useResult
$Res call({
 List<PokemonPreview> previews, bool isInitialLoading, bool isLoadingMore, bool hasReachedEnd, AppException? error, String searchQuery, String selectedType
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
@override @pragma('vm:prefer-inline') $Res call({Object? previews = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? hasReachedEnd = null,Object? error = freezed,Object? searchQuery = null,Object? selectedType = null,}) {
  return _then(_PokemonListState(
previews: null == previews ? _self._previews : previews // ignore: cast_nullable_to_non_nullable
as List<PokemonPreview>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as String,
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
