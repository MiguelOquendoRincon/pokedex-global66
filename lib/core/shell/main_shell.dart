import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

/// A shell widget that provides the primary navigation structure of the app.
///
/// It uses a [StatefulNavigationShell] to manage different feature tabs
/// (Pokémon list, Regions, Favorites, and Profile) and displays a
/// [NavigationBar] for switching between them.
class MainShell extends StatelessWidget {
  const MainShell({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColorsDark.surfaceVar : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (i) => navigationShell.goBranch(i),
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.navBar,
            unselectedItemColor: isDark
                ? Colors.white60
                : const Color(0xFF424242),
            selectedLabelStyle: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
            unselectedLabelStyle: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_sharp),
                activeIcon: const Icon(Icons.home_sharp),
                label: l10n.navPokemonList,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.language_sharp),
                activeIcon: const Icon(Icons.language_sharp),
                label: l10n.navRegions,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_sharp),
                activeIcon: const Icon(Icons.favorite_sharp),
                label: l10n.navFavorites,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_sharp),
                activeIcon: const Icon(Icons.person_sharp),
                label: l10n.navProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
