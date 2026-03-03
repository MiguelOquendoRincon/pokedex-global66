import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_global66/core/router/app_router.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_preview.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_list_skeleton.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/pokemon_type_chip.dart';

class PokemonCard extends ConsumerWidget {
  const PokemonCard({super.key, required this.pokemon, required this.types});

  final PokemonPreview pokemon;
  final List<String> types;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Determine the types to use: either from the preview or from the cache.
    var typesToUse = pokemon.types;
    if (typesToUse.isEmpty) {
      final cache = ref.watch(pokemonTypeCacheProvider);
      typesToUse = cache[pokemon.name] ?? [];
    }

    // If we still don't have types, show the skeleton.
    if (typesToUse.isEmpty) {
      return const PokemonListSkeletonItem();
    }

    final primaryType = typesToUse.first;
    final typeColor = AppColors.forType(primaryType);
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = favorites.any((f) => f.id == pokemon.id);

    return GestureDetector(
      onTap: () => context.go('${AppRoutes.pokedex}/detail/${pokemon.name}'),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: typeColor.withValues(alpha: 0.6),
          boxShadow: [
            BoxShadow(
              color: typeColor.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // ── Pokeball Watermark ──────────────────────────────
            Positioned(
              right: -5,
              bottom: -5,
              child: Icon(
                Icons.catching_pokemon,
                size: 110,
                color: Colors.white.withValues(alpha: 0.12),
              ),
            ),

            // ── Main Content ────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // Left: Texts
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          pokemon.formattedId,
                          style: context.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.textSubtitle,
                            fontSize: 12,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          pokemon.displayName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Iconized Type Chips
                        Wrap(
                          spacing: 6,
                          children: typesToUse
                              .map((t) => PokemonTypeChip(type: t))
                              .toList(),
                        ),
                      ],
                    ),
                  ),

                  // Right: Favorite & Image
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Small favorite toggle
                      GestureDetector(
                        onTap: () => ref
                            .read(favoritesProvider.notifier)
                            .toggleFromList(
                              id: pokemon.id,
                              name: pokemon.name,
                              primaryType: primaryType,
                            ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 22,
                          color: isFavorite ? Colors.white : Colors.white70,
                        ),
                      ),

                      // Pokémon Sprite
                      Hero(
                        tag: 'pokemon-${pokemon.id}',
                        child: CachedNetworkImage(
                          imageUrl: pokemon.imageUrl,
                          width: 64,
                          height: 64,
                          fit: BoxFit.contain,
                          placeholder: (_, __) => const SizedBox.shrink(),
                          errorWidget: (_, __, ___) => const Icon(
                            Icons.catching_pokemon,
                            color: Colors.white24,
                            size: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
