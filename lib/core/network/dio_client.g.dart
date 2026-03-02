// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides a fully configured [Dio] instance:
///   - Base URL + sensible timeouts
///   - [TalkerDioLogger] for request/response/error observability
///   - [ErrorInterceptor] to normalise errors early in the pipeline

@ProviderFor(dioClient)
final dioClientProvider = DioClientProvider._();

/// Provides a fully configured [Dio] instance:
///   - Base URL + sensible timeouts
///   - [TalkerDioLogger] for request/response/error observability
///   - [ErrorInterceptor] to normalise errors early in the pipeline

final class DioClientProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// Provides a fully configured [Dio] instance:
  ///   - Base URL + sensible timeouts
  ///   - [TalkerDioLogger] for request/response/error observability
  ///   - [ErrorInterceptor] to normalise errors early in the pipeline
  DioClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioClientHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dioClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioClientHash() => r'a054a9ab676babd530a37e01230ca900ad184120';
