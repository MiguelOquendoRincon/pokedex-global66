// ─── bootstrap.dart ───────────────────────────────────────────────────────────
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/core/storage/local_storage.dart';
import 'package:pokedex_global66/pokedex_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'core/observability/app_talker.dart';
import 'core/theme/theme_provider.dart';
import 'features/favorites/presentation/providers/favorites_provider.dart';
import 'features/onboarding/presentation/providers/onboarding_provider.dart';

/// Single entry point for all app initialisation.
///
/// Order of operations (matters):
///   1. Flutter engine binding
///   2. System UI chrome config
///   3. Async dependencies (SharedPreferences)
///   4. Talker (needs to be ready before any provider fires)
///   5. ProviderContainer with all overrides + observers
///   6. Global Flutter error hooks
///   7. runApp
Future<void> bootstrap() async {
  // ── 1. Binding ─────────────────────────────────────────────────────────────
  WidgetsFlutterBinding.ensureInitialized();

  // ── 2. System UI ───────────────────────────────────────────────────────────
  // Transparent status/nav bars; each screen sets its own overlay style
  // via AppBarTheme.systemOverlayStyle.
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  // Lock to portrait — Pokédex is a portrait-first app.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // ── 3. Async dependencies ──────────────────────────────────────────────────
  final prefs = await SharedPreferences.getInstance();

  // ── 4. Talker ──────────────────────────────────────────────────────────────
  final talker = TalkerFlutter.init(
    settings: TalkerSettings(enabled: true, useConsoleLogs: true),
  );
  talker.info('Bootstrap started');

  // ── 5. ProviderContainer ───────────────────────────────────────────────────
  final container = ProviderContainer(
    observers: [TalkerRiverpodObserver(talker)],
    overrides: [
      // Observability
      talkerProvider.overrideWithValue(talker),

      // SharedPreferences — exposed to OnboardingProvider & ThemeNotifier
      sharedPrefsProvider.overrideWithValue(prefs),

      // Local storage abstraction — used by FavoritesRepository
      localStorageProvider.overrideWithValue(SharedPrefsLocalStorage(prefs)),
    ],
  );

  // Warm up keepAlive providers that must be ready before the first frame:
  //   • FavoritesNotifier loads saved favorites from disk
  //   • ThemeNotifier reads saved theme mode
  //   • OnboardingDone determines the initial route
  container.read(favoritesProvider);
  container.read(themeProvider);
  container.read(onboardingDoneProvider);

  talker.info('Providers warmed up');

  // ── 6. Global error hooks ──────────────────────────────────────────────────

  // Flutter framework errors (e.g. build/layout exceptions)
  FlutterError.onError = (details) {
    talker.handle(
      details.exception,
      details.stack,
      '[FlutterError] ${details.library}',
    );
  };

  // Dart async errors that escape the Flutter zone (e.g. isolates, timers)
  PlatformDispatcher.instance.onError = (error, stack) {
    talker.handle(error, stack, '[PlatformDispatcher] Uncaught async error');
    return true; // true = error handled, don't crash
  };

  talker.info('Error handlers registered');

  // ── 7. Run ─────────────────────────────────────────────────────────────────
  runApp(
    UncontrolledProviderScope(container: container, child: const PokedexApp()),
  );

  talker.info('App running ✓');
}
