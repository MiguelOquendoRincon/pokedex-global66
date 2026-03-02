import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/core/l10n/generated/app_localizations.dart';
import 'package:pokedex_global66/core/l10n/locale_notifier.dart';
import 'package:pokedex_global66/core/router/app_router.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';

/// Root widget of the application.
///
/// Responsibilities (Single Responsibility per layer):
///   • Wires [MaterialApp.router] with [GoRouter]         → navigation
///   • Configures localisation delegates and supported locales → I18N
///   • Applies the design-system [ThemeData]               → theming
///   • Reads [LocaleNotifier] to allow runtime locale switching
///
/// Everything else (state, business logic, DI) lives in
/// providers / use-cases / repositories — never here.
class PokedexApp extends ConsumerWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      routerConfig: router,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supported) {
        if (deviceLocale == null) return supported.first;
        for (final s in supported) {
          if (s.languageCode == deviceLocale.languageCode) return s;
        }
        return supported.first;
      },
      onGenerateTitle: (ctx) => AppLocalizations.of(ctx).appTitle,
    );
  }
}
