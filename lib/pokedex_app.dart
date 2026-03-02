import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/core/l10n/generated/app_localizations.dart';
import 'package:pokedex_global66/core/l10n/locale_notifier.dart';
import 'package:pokedex_global66/core/router/app_router.dart';

import 'core/theme/app_theme.dart';

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

    return MaterialApp.router(
      // ── Identity ──────────────────────────────────────────────────────────
      debugShowCheckedModeBanner: false,

      // ── Theming ───────────────────────────────────────────────────────────
      theme: AppTheme.light,

      // ── Navigation ────────────────────────────────────────────────────────
      routerConfig: router,

      // ── Internationalisation ──────────────────────────────────────────────
      // null → Flutter resolves from device; explicit Locale overrides it.
      locale: locale,

      supportedLocales: AppLocalizations.supportedLocales,

      localizationsDelegates: const [
        AppLocalizations.delegate, // generated ARB delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // Fallback: if device locale isn't supported, default to English.
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (deviceLocale == null) return supportedLocales.first;

        for (final supported in supportedLocales) {
          if (supported.languageCode == deviceLocale.languageCode) {
            return supported;
          }
        }
        return supportedLocales.first; // en
      },

      // ── Accessibility ─────────────────────────────────────────────────────
      // Title is resolved per locale — shown in task switchers.
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
    );
  }
}
