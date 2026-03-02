import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'app_talker.g.dart';

/// Singleton [Talker] instance used across the entire app.
/// Exposed as a Riverpod provider so it can be injected into
/// interceptors, use-cases and tested with overrides.
@Riverpod(keepAlive: true)
Talker talker(Ref ref) {
  return TalkerFlutter.init(
    settings: TalkerSettings(enabled: true, useConsoleLogs: true),
  );
}

// ─── Riverpod Observer ────────────────────────────────────────────────────────

/// Plugs into Riverpod's ProviderObserver to log every state change,
/// provider creation, disposal and unhandled error.
final class TalkerRiverpodObserver extends ProviderObserver {
  const TalkerRiverpodObserver(this._talker);
  final Talker _talker;

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    _talker.verbose(
      '[Riverpod] ${context.provider.name ?? context.provider.runtimeType} '
      'updated: $newValue',
    );
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    _talker.handle(
      error,
      stackTrace,
      '[Riverpod] ${context.provider.name ?? context.provider.runtimeType} FAILED',
    );
  }
}
