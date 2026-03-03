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
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/pokemon_type_chip.dart';

class PokemonCard extends ConsumerWidget {
  const PokemonCard({super.key, required this.pokemon, required this.types});

  final PokemonPreview pokemon;
  final List<String> types;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ⚡ Reactive Cache: Watch for this pokemon's types in the global cache.
    // When the background enrichment completes, this specific card will rebuild.
    final cachedTypes = ref.watch(
      pokemonTypeCacheProvider.select((c) => c[pokemon.name]),
    );

    // Prioritize cached types over the ones passed in (which might be empty)
    final effectiveTypes = cachedTypes ?? types;
    final hasTypes = effectiveTypes.isNotEmpty;

    final primaryType = hasTypes ? effectiveTypes.first : 'normal';
    final typeColor = hasTypes
        ? AppColors.forType(primaryType)
        : Colors.grey.shade300;

    final isFavorite = ref.watch(
      favoritesProvider.select((favs) => favs.any((f) => f.id == pokemon.id)),
    );

    return GestureDetector(
      onTap: () => context.go('${AppRoutes.pokedex}/detail/${pokemon.name}'),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: typeColor.withValues(alpha: 0.4),
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
            // ── Main Content ────────────────────────────────────
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left: Texts
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
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
                          children: hasTypes
                              ? effectiveTypes
                                    .map((t) => PokemonTypeChip(type: t))
                                    .toList()
                              : [
                                  _buildTypePlaceholder(),
                                  _buildTypePlaceholder(),
                                ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Right: Favorite & Image
                // Pokémon Sprite with Category Icon Background
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 16,
                    ),
                    height: 120,
                    decoration: BoxDecoration(
                      color: typeColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        // Category Icon
                        Image.asset(
                          'assets/categories/category_${primaryType.toLowerCase()}.png',
                          width: 92,
                          height: 92,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),

                        // Pokémon Sprite
                        Hero(
                          tag: 'pokemon-${pokemon.id}',
                          child: CachedNetworkImage(
                            imageUrl: pokemon.imageUrl,
                            width: 94,
                            height: 94,
                            fit: BoxFit.contain,
                            placeholder: (_, _) => const SizedBox.shrink(),
                            errorWidget: (_, _, _) => const Icon(
                              Icons.catching_pokemon,
                              color: Colors.white24,
                              size: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Small favorite toggle
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () => ref
                    .read(favoritesProvider.notifier)
                    .toggleFromList(
                      id: pokemon.id,
                      name: pokemon.name,
                      primaryType: primaryType,
                    ),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    color: Color(0x75757599),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 22,
                    color: isFavorite ? Colors.red : Colors.white70,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypePlaceholder() {
    return Container(
      width: 60,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
