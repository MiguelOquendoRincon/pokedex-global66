import 'package:dio/dio.dart';
import 'app_exception.dart';

/// Maps any [DioException] or generic [Object] to a typed [AppException].
/// Single Responsibility: one place in the codebase that knows about Dio errors.
abstract final class FailureHandler {
  FailureHandler._();

  /// Converts a [DioException] into the domain-specific [AppException].
  ///
  /// Handles various Dio error types such as timeouts, connection errors,
  /// and bad responses by mapping them to their corresponding [AppException] cases.
  static AppException fromDioException(DioException e) {
    return switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => const AppException.timeout(),

      DioExceptionType.connectionError => const AppException.noInternet(),

      DioExceptionType.badResponse => _fromStatusCode(
        e.response?.statusCode,
        e.response?.statusMessage ?? 'Bad response',
      ),

      DioExceptionType.cancel => const AppException.network(
        message: 'Request cancelled',
      ),

      _ => AppException.unknown(
        message: e.message ?? 'Unknown network error',
        cause: e,
      ),
    };
  }

  /// Converts any caught object into an [AppException].
  ///
  /// This is used as a catch-all in `try-catch` blocks. It specifically handles
  /// [DioException] and [FormatException], defaulting to [AppException.unknown] for others.
  static AppException fromObject(Object e) {
    if (e is DioException) return fromDioException(e);
    if (e is FormatException) {
      return AppException.parsing(message: e.message);
    }
    return AppException.unknown(message: e.toString(), cause: e);
  }

  static AppException _fromStatusCode(int? code, String message) =>
      switch (code) {
        404 => const AppException.notFound(),
        500 => AppException.serverError(message: message, statusCode: code),
        _ => AppException.network(message: message, statusCode: code),
      };
}
