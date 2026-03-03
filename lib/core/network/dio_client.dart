import 'package:dio/dio.dart';
import 'package:pokedex_global66/core/security/certificate_pinning_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../observability/app_talker.dart';
import 'api_constants.dart';
import 'interceptors/error_interceptor.dart';

part 'dio_client.g.dart';

/// Provides a fully configured [Dio] instance:
///   - Base URL + sensible timeouts
///   - [TalkerDioLogger] for request/response/error observability
///   - [ErrorInterceptor] to normalise errors early in the pipeline
@Riverpod(keepAlive: true)
Dio dioClient(Ref ref) {
  final talker = ref.read(talkerProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // Apply certificate pinning adapter
  applyPinningAdapter(dio, talker);

  // Order matters: Talker first (logs raw request), then error normaliser.
  dio.interceptors.addAll([
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: false, // avoid leaking sensitive headers
        printResponseData: false, // too verbose for list endpoints
        printErrorData: true,
      ),
    ),
    ErrorInterceptor(talker),
  ]);

  return dio;
}
