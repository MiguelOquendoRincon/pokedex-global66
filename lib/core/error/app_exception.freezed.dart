// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppException {

 String get message;
/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<AppException> get copyWith => _$AppExceptionCopyWithImpl<AppException>(this as AppException, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException(message: $message)';
}


}

/// @nodoc
abstract mixin class $AppExceptionCopyWith<$Res>  {
  factory $AppExceptionCopyWith(AppException value, $Res Function(AppException) _then) = _$AppExceptionCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AppExceptionCopyWithImpl<$Res>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._self, this._then);

  final AppException _self;
  final $Res Function(AppException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppException].
extension AppExceptionPatterns on AppException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NetworkException value)?  network,TResult Function( TimeoutException value)?  timeout,TResult Function( NoInternetException value)?  noInternet,TResult Function( NotFoundException value)?  notFound,TResult Function( ServerErrorException value)?  serverError,TResult Function( ParsingException value)?  parsing,TResult Function( StorageException value)?  storage,TResult Function( UnknownException value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NetworkException() when network != null:
return network(_that);case TimeoutException() when timeout != null:
return timeout(_that);case NoInternetException() when noInternet != null:
return noInternet(_that);case NotFoundException() when notFound != null:
return notFound(_that);case ServerErrorException() when serverError != null:
return serverError(_that);case ParsingException() when parsing != null:
return parsing(_that);case StorageException() when storage != null:
return storage(_that);case UnknownException() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NetworkException value)  network,required TResult Function( TimeoutException value)  timeout,required TResult Function( NoInternetException value)  noInternet,required TResult Function( NotFoundException value)  notFound,required TResult Function( ServerErrorException value)  serverError,required TResult Function( ParsingException value)  parsing,required TResult Function( StorageException value)  storage,required TResult Function( UnknownException value)  unknown,}){
final _that = this;
switch (_that) {
case NetworkException():
return network(_that);case TimeoutException():
return timeout(_that);case NoInternetException():
return noInternet(_that);case NotFoundException():
return notFound(_that);case ServerErrorException():
return serverError(_that);case ParsingException():
return parsing(_that);case StorageException():
return storage(_that);case UnknownException():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NetworkException value)?  network,TResult? Function( TimeoutException value)?  timeout,TResult? Function( NoInternetException value)?  noInternet,TResult? Function( NotFoundException value)?  notFound,TResult? Function( ServerErrorException value)?  serverError,TResult? Function( ParsingException value)?  parsing,TResult? Function( StorageException value)?  storage,TResult? Function( UnknownException value)?  unknown,}){
final _that = this;
switch (_that) {
case NetworkException() when network != null:
return network(_that);case TimeoutException() when timeout != null:
return timeout(_that);case NoInternetException() when noInternet != null:
return noInternet(_that);case NotFoundException() when notFound != null:
return notFound(_that);case ServerErrorException() when serverError != null:
return serverError(_that);case ParsingException() when parsing != null:
return parsing(_that);case StorageException() when storage != null:
return storage(_that);case UnknownException() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  int? statusCode)?  network,TResult Function( String message)?  timeout,TResult Function( String message)?  noInternet,TResult Function( String message)?  notFound,TResult Function( String message,  int? statusCode)?  serverError,TResult Function( String message)?  parsing,TResult Function( String message)?  storage,TResult Function( String message,  Object? cause)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NetworkException() when network != null:
return network(_that.message,_that.statusCode);case TimeoutException() when timeout != null:
return timeout(_that.message);case NoInternetException() when noInternet != null:
return noInternet(_that.message);case NotFoundException() when notFound != null:
return notFound(_that.message);case ServerErrorException() when serverError != null:
return serverError(_that.message,_that.statusCode);case ParsingException() when parsing != null:
return parsing(_that.message);case StorageException() when storage != null:
return storage(_that.message);case UnknownException() when unknown != null:
return unknown(_that.message,_that.cause);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  int? statusCode)  network,required TResult Function( String message)  timeout,required TResult Function( String message)  noInternet,required TResult Function( String message)  notFound,required TResult Function( String message,  int? statusCode)  serverError,required TResult Function( String message)  parsing,required TResult Function( String message)  storage,required TResult Function( String message,  Object? cause)  unknown,}) {final _that = this;
switch (_that) {
case NetworkException():
return network(_that.message,_that.statusCode);case TimeoutException():
return timeout(_that.message);case NoInternetException():
return noInternet(_that.message);case NotFoundException():
return notFound(_that.message);case ServerErrorException():
return serverError(_that.message,_that.statusCode);case ParsingException():
return parsing(_that.message);case StorageException():
return storage(_that.message);case UnknownException():
return unknown(_that.message,_that.cause);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  int? statusCode)?  network,TResult? Function( String message)?  timeout,TResult? Function( String message)?  noInternet,TResult? Function( String message)?  notFound,TResult? Function( String message,  int? statusCode)?  serverError,TResult? Function( String message)?  parsing,TResult? Function( String message)?  storage,TResult? Function( String message,  Object? cause)?  unknown,}) {final _that = this;
switch (_that) {
case NetworkException() when network != null:
return network(_that.message,_that.statusCode);case TimeoutException() when timeout != null:
return timeout(_that.message);case NoInternetException() when noInternet != null:
return noInternet(_that.message);case NotFoundException() when notFound != null:
return notFound(_that.message);case ServerErrorException() when serverError != null:
return serverError(_that.message,_that.statusCode);case ParsingException() when parsing != null:
return parsing(_that.message);case StorageException() when storage != null:
return storage(_that.message);case UnknownException() when unknown != null:
return unknown(_that.message,_that.cause);case _:
  return null;

}
}

}

/// @nodoc


class NetworkException implements AppException {
  const NetworkException({required this.message, this.statusCode});
  

@override final  String message;
 final  int? statusCode;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkExceptionCopyWith<NetworkException> get copyWith => _$NetworkExceptionCopyWithImpl<NetworkException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkException&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,statusCode);

@override
String toString() {
  return 'AppException.network(message: $message, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $NetworkExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $NetworkExceptionCopyWith(NetworkException value, $Res Function(NetworkException) _then) = _$NetworkExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode
});




}
/// @nodoc
class _$NetworkExceptionCopyWithImpl<$Res>
    implements $NetworkExceptionCopyWith<$Res> {
  _$NetworkExceptionCopyWithImpl(this._self, this._then);

  final NetworkException _self;
  final $Res Function(NetworkException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,}) {
  return _then(NetworkException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class TimeoutException implements AppException {
  const TimeoutException({this.message = 'Request timed out'});
  

@override@JsonKey() final  String message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeoutExceptionCopyWith<TimeoutException> get copyWith => _$TimeoutExceptionCopyWithImpl<TimeoutException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeoutException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.timeout(message: $message)';
}


}

/// @nodoc
abstract mixin class $TimeoutExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $TimeoutExceptionCopyWith(TimeoutException value, $Res Function(TimeoutException) _then) = _$TimeoutExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TimeoutExceptionCopyWithImpl<$Res>
    implements $TimeoutExceptionCopyWith<$Res> {
  _$TimeoutExceptionCopyWithImpl(this._self, this._then);

  final TimeoutException _self;
  final $Res Function(TimeoutException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TimeoutException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NoInternetException implements AppException {
  const NoInternetException({this.message = 'No internet connection'});
  

@override@JsonKey() final  String message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoInternetExceptionCopyWith<NoInternetException> get copyWith => _$NoInternetExceptionCopyWithImpl<NoInternetException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoInternetException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.noInternet(message: $message)';
}


}

/// @nodoc
abstract mixin class $NoInternetExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $NoInternetExceptionCopyWith(NoInternetException value, $Res Function(NoInternetException) _then) = _$NoInternetExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NoInternetExceptionCopyWithImpl<$Res>
    implements $NoInternetExceptionCopyWith<$Res> {
  _$NoInternetExceptionCopyWithImpl(this._self, this._then);

  final NoInternetException _self;
  final $Res Function(NoInternetException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NoInternetException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NotFoundException implements AppException {
  const NotFoundException({this.message = 'Resource not found'});
  

@override@JsonKey() final  String message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundExceptionCopyWith<NotFoundException> get copyWith => _$NotFoundExceptionCopyWithImpl<NotFoundException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFoundException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $NotFoundExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $NotFoundExceptionCopyWith(NotFoundException value, $Res Function(NotFoundException) _then) = _$NotFoundExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NotFoundExceptionCopyWithImpl<$Res>
    implements $NotFoundExceptionCopyWith<$Res> {
  _$NotFoundExceptionCopyWithImpl(this._self, this._then);

  final NotFoundException _self;
  final $Res Function(NotFoundException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NotFoundException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ServerErrorException implements AppException {
  const ServerErrorException({required this.message, this.statusCode});
  

@override final  String message;
 final  int? statusCode;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerErrorExceptionCopyWith<ServerErrorException> get copyWith => _$ServerErrorExceptionCopyWithImpl<ServerErrorException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerErrorException&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,statusCode);

@override
String toString() {
  return 'AppException.serverError(message: $message, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $ServerErrorExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $ServerErrorExceptionCopyWith(ServerErrorException value, $Res Function(ServerErrorException) _then) = _$ServerErrorExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, int? statusCode
});




}
/// @nodoc
class _$ServerErrorExceptionCopyWithImpl<$Res>
    implements $ServerErrorExceptionCopyWith<$Res> {
  _$ServerErrorExceptionCopyWithImpl(this._self, this._then);

  final ServerErrorException _self;
  final $Res Function(ServerErrorException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,}) {
  return _then(ServerErrorException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class ParsingException implements AppException {
  const ParsingException({required this.message});
  

@override final  String message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsingExceptionCopyWith<ParsingException> get copyWith => _$ParsingExceptionCopyWithImpl<ParsingException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsingException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.parsing(message: $message)';
}


}

/// @nodoc
abstract mixin class $ParsingExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $ParsingExceptionCopyWith(ParsingException value, $Res Function(ParsingException) _then) = _$ParsingExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ParsingExceptionCopyWithImpl<$Res>
    implements $ParsingExceptionCopyWith<$Res> {
  _$ParsingExceptionCopyWithImpl(this._self, this._then);

  final ParsingException _self;
  final $Res Function(ParsingException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ParsingException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StorageException implements AppException {
  const StorageException({required this.message});
  

@override final  String message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorageExceptionCopyWith<StorageException> get copyWith => _$StorageExceptionCopyWithImpl<StorageException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorageException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.storage(message: $message)';
}


}

/// @nodoc
abstract mixin class $StorageExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $StorageExceptionCopyWith(StorageException value, $Res Function(StorageException) _then) = _$StorageExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$StorageExceptionCopyWithImpl<$Res>
    implements $StorageExceptionCopyWith<$Res> {
  _$StorageExceptionCopyWithImpl(this._self, this._then);

  final StorageException _self;
  final $Res Function(StorageException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(StorageException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnknownException implements AppException {
  const UnknownException({required this.message, this.cause});
  

@override final  String message;
 final  Object? cause;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownExceptionCopyWith<UnknownException> get copyWith => _$UnknownExceptionCopyWithImpl<UnknownException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownException&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.cause, cause));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(cause));

@override
String toString() {
  return 'AppException.unknown(message: $message, cause: $cause)';
}


}

/// @nodoc
abstract mixin class $UnknownExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $UnknownExceptionCopyWith(UnknownException value, $Res Function(UnknownException) _then) = _$UnknownExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? cause
});




}
/// @nodoc
class _$UnknownExceptionCopyWithImpl<$Res>
    implements $UnknownExceptionCopyWith<$Res> {
  _$UnknownExceptionCopyWithImpl(this._self, this._then);

  final UnknownException _self;
  final $Res Function(UnknownException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cause = freezed,}) {
  return _then(UnknownException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cause: freezed == cause ? _self.cause : cause ,
  ));
}


}

// dart format on
