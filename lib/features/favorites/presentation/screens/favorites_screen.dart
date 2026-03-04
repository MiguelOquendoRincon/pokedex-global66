// ══════════════════════════════════════════════════════════════════════════════
// features/favorites/presentation/screens/favorites_screen.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/icons_svg.dart';
import 'package:pokedex_global66/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_preview.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final typeCache = ref.watch(pokemonTypeCacheProvider);
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: context.contentBg,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Header ──────────────────────────────────────────────────────
            if (favorites.isNotEmpty)
              SliverAppBar(
                floating: true,
                backgroundColor: context.contentBg,
                surfaceTintColor: Colors.transparent,
                centerTitle: true,
                titleSpacing: 16,
                leading: IconButton(
                  icon: Icon(CupertinoIcons.back, color: context.textPrimary),
                  // Navigate to pokemon list screen using go_router
                  onPressed: () => context.go('/pokedex'),
                ),
                title: Text(
                  l10n.navFavorites,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: context.textPrimary,
                  ),
                ),
              ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // ── Content ─────────────────────────────────────────────────────
            if (favorites.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          CustomIcons.pokemonNotFound,
                          width: 185,
                          height: 185,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.favoritesEmpty,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.favoritesEmptySubtitle,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final fav = favorites[index];
                    final preview = PokemonPreview(
                      id: fav.id,
                      name: fav.name,
                      types: typeCache[fav.name] ?? [fav.primaryType],
                      imageUrl: fav.imageUrl,
                    );

                    return Dismissible(
                      key: Key('fav_${fav.id}'),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction) async {
                        return await showCupertinoDialog<bool>(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: Text(l10n.deleteConfirmTitle),
                            content: Text(
                              l10n.deleteConfirmMessage(fav.displayName),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text(l10n.commonCancel),
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                              ),
                              CupertinoDialogAction(
                                isDestructiveAction: true,
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(l10n.commonDelete),
                              ),
                            ],
                          ),
                        );
                      },
                      onDismissed: (_) {
                        ref
                            .read(favoritesProvider.notifier)
                            .toggleFromList(
                              id: fav.id,
                              name: fav.name,
                              primaryType: fav.primaryType,
                            );

                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              l10n.removedFromFavorites(fav.displayName),
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.only(right: 24),
                        decoration: BoxDecoration(
                          color: const Color(0xFFCD3131),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Icon(
                          CupertinoIcons.trash,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      child: PokemonCard(
                        pokemon: preview,
                        types: preview.types,
                      ),
                    );
                  }, childCount: favorites.length),
                ),
              ),

            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}
