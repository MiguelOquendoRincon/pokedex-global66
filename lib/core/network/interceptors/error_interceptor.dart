import 'package:dio/dio.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../error/failure_handler.dart';

/// Converts [DioException] to typed [AppException] before it propagates.
/// Repositories receive a clean domain error, not a raw Dio object.
final class ErrorInterceptor extends Interceptor {
  const ErrorInterceptor(this._talker);
  final Talker _talker;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final appException = FailureHandler.fromDioException(err);

    _talker.error(
      'HTTP Error [${err.response?.statusCode}] ${err.requestOptions.uri}',
      appException,
      err.stackTrace,
    );

    // Wrap in DioException so Dio's contract is kept,
    // but attach our domain exception as the inner error.
    handler.next(err.copyWith(error: appException));
  }
}
