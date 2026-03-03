import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_global66/core/shell/main_shell.dart';
import 'package:pokedex_global66/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:pokedex_global66/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/screens/pokemon_detail_screen.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/screens/pokemon_list_screen.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/screens/pokemon_list_screen2.dart';
import 'package:pokedex_global66/features/profile/presentation/screens/profile_screen.dart';
import 'package:pokedex_global66/features/regions/presentation/screens/regions_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pokedex_global66/features/onboarding/presentation/providers/onboarding_provider.dart';

part 'app_router.g.dart';

// ─── Route name constants ─────────────────────────────────────────────────────
abstract final class AppRoutes {
  static const onboarding = '/onboarding';
  static const pokedex = '/pokedex';
  static const detail = 'detail'; // relative: /pokedex/detail/:name
  static const regions = '/regions';
  static const favorites = '/favorites';
  static const profile = '/profile';
}

@riverpod
GoRouter appRouter(Ref ref) {
  // Reactive redirect: if onboarding not done → force /onboarding
  final onboardingDone = ref.watch(onboardingDoneProvider);

  return GoRouter(
    initialLocation: AppRoutes.pokedex,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final goingToOnboarding = state.matchedLocation == AppRoutes.onboarding;

      if (!onboardingDone && !goingToOnboarding) return AppRoutes.onboarding;
      if (onboardingDone && goingToOnboarding) return AppRoutes.pokedex;
      return null;
    },
    routes: [
      // ── Onboarding (full-screen, outside shell) ───────────────────────────
      GoRoute(
        path: AppRoutes.onboarding,
        pageBuilder: (context, state) => _fadeTransition(
          key: state.pageKey,
          child: const OnboardingScreen(),
        ),
      ),

      // ── Main shell (BottomNavigationBar) ──────────────────────────────────
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          // Tab 1 — Pokédex
          GoRoute(
            path: AppRoutes.pokedex,
            pageBuilder: (context, state) => _noTransition(
              key: state.pageKey,
              // child: PokemonListScreen2(),
              child: const PokemonListScreen(),
            ),
            routes: [
              GoRoute(
                path: 'detail/:name',
                pageBuilder: (context, state) {
                  final name = state.pathParameters['name']!;
                  return _slideUpTransition(
                    key: state.pageKey,
                    child: PokemonDetailScreen(pokemonName: name),
                  );
                },
              ),
            ],
          ),

          // Tab 2 — Regions
          GoRoute(
            path: AppRoutes.regions,
            pageBuilder: (context, state) =>
                _noTransition(key: state.pageKey, child: const RegionsScreen()),
          ),

          // Tab 3 — Favorites
          GoRoute(
            path: AppRoutes.favorites,
            pageBuilder: (context, state) => _noTransition(
              key: state.pageKey,
              child: const FavoritesScreen(),
            ),
          ),

          // Tab 4 — Profile
          GoRoute(
            path: AppRoutes.profile,
            pageBuilder: (context, state) =>
                _noTransition(key: state.pageKey, child: const ProfileScreen()),
          ),
        ],
      ),
    ],
  );
}

// ─── Page transition helpers ─────────────────────────────────────────────────

CustomTransitionPage<void> _noTransition({
  required LocalKey key,
  required Widget child,
}) => CustomTransitionPage(
  key: key,
  child: child,
  transitionsBuilder: (_, _, _, c) => c,
);

CustomTransitionPage<void> _fadeTransition({
  required LocalKey key,
  required Widget child,
}) => CustomTransitionPage(
  key: key,
  child: child,
  transitionDuration: const Duration(milliseconds: 400),
  transitionsBuilder: (_, animation, _, c) =>
      FadeTransition(opacity: animation, child: c),
);

CustomTransitionPage<void> _slideUpTransition({
  required LocalKey key,
  required Widget child,
}) => CustomTransitionPage(
  key: key,
  child: child,
  transitionDuration: const Duration(milliseconds: 350),
  transitionsBuilder: (_, animation, _, c) => SlideTransition(
    position: Tween(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
    child: FadeTransition(opacity: animation, child: c),
  ),
);
