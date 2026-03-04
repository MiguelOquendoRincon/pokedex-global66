// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider that exposes the application's [GoRouter] configuration.
///
/// It handles navigation state, redirects (e.g., forcing onboarding if not done),
/// and defines all the routes in the app, including the main shell with tabs.

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

/// A provider that exposes the application's [GoRouter] configuration.
///
/// It handles navigation state, redirects (e.g., forcing onboarding if not done),
/// and defines all the routes in the app, including the main shell with tabs.

final class AppRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// A provider that exposes the application's [GoRouter] configuration.
  ///
  /// It handles navigation state, redirects (e.g., forcing onboarding if not done),
  /// and defines all the routes in the app, including the main shell with tabs.
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'fea6b58ac8609d30626ecc59f395658a5247b065';
