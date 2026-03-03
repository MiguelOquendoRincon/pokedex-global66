import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'app_talker.g.dart';

/// Builds a [Talker] instance tuned for the current build mode:
///
/// • debug / profile → full logging to console + in-app viewer.
/// • release         → only errors/warnings logged; console output
///                     disabled to prevent reverse-engineering exposure.
Talker buildTalker() {
  return TalkerFlutter.init(
    settings: TalkerSettings(
      enabled: !kReleaseMode,
      useConsoleLogs: !kReleaseMode,
    ),
    filter: kReleaseMode ? _ReleaseLogFilter() : null,
  );
}

/// Drops verbose, debug and info logs in release builds.
/// Errors and warnings still pass through for crash reporting.
final class _ReleaseLogFilter extends TalkerFilter {
  _ReleaseLogFilter();

  @override
  bool filter(TalkerData item) {
    return switch (item.logLevel) {
      LogLevel.verbose || LogLevel.debug || LogLevel.info => false,
      _ => true, // warning, error, critical pass through
    };
  }
}

@Riverpod(keepAlive: true)
Talker talker(Ref ref) => buildTalker();

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
    // Only log state changes in non-release builds.
    if (kReleaseMode) return;
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
