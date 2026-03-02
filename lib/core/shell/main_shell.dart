import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/router/app_router.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

class MainShell extends StatelessWidget {
  const MainShell({required this.child, super.key});
  final Widget child;

  static const _tabs = [
    AppRoutes.pokedex,
    AppRoutes.regions,
    AppRoutes.favorites,
    AppRoutes.profile,
  ];

  int _locationToIndex(String location) {
    final idx = _tabs.indexWhere((t) => location.startsWith(t));
    return idx < 0 ? 0 : idx;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final currentIndex = _locationToIndex(location);
    final l10n = context.l10n;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (i) => context.go(_tabs[i]),
        indicatorColor: AppColors.primary.withValues(alpha: 0.12),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.catching_pokemon_outlined),
            selectedIcon: const Icon(
              Icons.catching_pokemon,
              color: AppColors.primary,
            ),
            label: l10n.navPokemonList,
          ),
          NavigationDestination(
            icon: const Icon(Icons.public_outlined),
            selectedIcon: const Icon(Icons.public, color: AppColors.primary),
            label: l10n.navRegions,
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite_outline),
            selectedIcon: const Icon(Icons.favorite, color: AppColors.primary),
            label: l10n.navFavorites,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person, color: AppColors.primary),
            label: l10n.navProfile,
          ),
        ],
      ),
    );
  }
}
