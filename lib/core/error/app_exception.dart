import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

/// Sealed domain of all possible failures.
/// Using [Freezed] unions → exhaustive pattern matching in UI.
@freezed
sealed class AppException with _$AppException implements Exception {
  // Network / HTTP layer
  const factory AppException.network({
    required String message,
    int? statusCode,
  }) = NetworkException;

  const factory AppException.timeout({
    @Default('Request timed out') String message,
  }) = TimeoutException;

  const factory AppException.noInternet({
    @Default('No internet connection') String message,
  }) = NoInternetException;

  // API / parsing
  const factory AppException.notFound({
    @Default('Resource not found') String message,
  }) = NotFoundException;

  const factory AppException.serverError({
    required String message,
    int? statusCode,
  }) = ServerErrorException;

  const factory AppException.parsing({required String message}) =
      ParsingException;

  // Local storage
  const factory AppException.storage({required String message}) =
      StorageException;

  // Unknown / unexpected
  const factory AppException.unknown({required String message, Object? cause}) =
      UnknownException;
}
