// ─── bootstrap.dart ───────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/core/storage/local_storage.dart';
import 'package:pokedex_global66/pokedex_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'core/observability/app_talker.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create Talker early so it can capture initialisation errors.
  final talker = TalkerFlutter.init();
  talker.info('App bootstrap started');

  // Initialise async dependencies BEFORE runApp.
  final prefs = await SharedPreferences.getInstance();

  // Riverpod container with our observer wired to Talker.
  final container = ProviderContainer(
    observers: [TalkerRiverpodObserver(talker)],
    overrides: [
      // Override talkerProvider so every downstream provider gets this instance.
      talkerProvider.overrideWithValue(talker),
      // DIP: inject concrete SharedPrefs implementation behind the interface.
      localStorageProvider.overrideWithValue(SharedPrefsLocalStorage(prefs)),
    ],
  );

  FlutterError.onError = (details) {
    talker.handle(details.exception, details.stack, 'FlutterError');
  };

  runApp(
    UncontrolledProviderScope(container: container, child: const PokedexApp()),
  );
}
