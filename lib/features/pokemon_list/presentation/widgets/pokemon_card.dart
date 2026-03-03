import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_global66/core/router/app_router.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_list_provider.dart';
import 'package:shimmer/shimmer.dart';

class PokemonCard extends ConsumerWidget {
  const PokemonCard({required this.pokemon, super.key});
  final PokemonSummary pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeCache = ref.watch(pokemonTypeCacheProvider);
    final primaryType = typeCache[pokemon.name] ?? '';
    final typeColor = primaryType.isNotEmpty
        ? AppColors.forType(primaryType)
        : context.colorScheme.primary;

    // In dark mode: slightly elevated card with colored tint.
    // In light mode: soft pastel tint from the type color.
    final bgColor = context.isDark
        ? Color.alphaBlend(
            typeColor.withValues(alpha: 0.12),
            AppColorsDark.surfaceVar,
          )
        : typeColor.withValues(alpha: 0.18);

    return GestureDetector(
      onTap: () => context.go('${AppRoutes.pokedex}/detail/${pokemon.name}'),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: context.isDark
              ? Border.all(color: typeColor.withValues(alpha: 0.25), width: 0.5)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: context.isDark ? 0.25 : 0.07,
              ),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // ── Pokéball watermark ─────────────────────────────────────
            Positioned(
              right: -10,
              bottom: -10,
              child: Icon(
                Icons.catching_pokemon,
                size: 80,
                color: context.watermarkColor,
              ),
            ),

            // ── Text info ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.formattedId,
                    style: TextStyle(
                      fontSize: 10,
                      color: context.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    pokemon.displayName,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: context.textPrimary,
                    ),
                  ),
                  if (primaryType.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    _TypeBadge(type: primaryType, color: typeColor),
                  ],
                ],
              ),
            ),

            // ── Sprite ────────────────────────────────────────────────
            Positioned(
              right: 4,
              bottom: 4,
              child: Hero(
                tag: 'pokemon-${pokemon.id}',
                child: CachedNetworkImage(
                  imageUrl: pokemon.imageUrl,
                  width: 72,
                  height: 72,
                  fit: BoxFit.contain,
                  placeholder: (_, __) => Shimmer.fromColors(
                    baseColor: context.isDark
                        ? Colors.grey.shade800
                        : Colors.grey.shade200,
                    highlightColor: context.isDark
                        ? Colors.grey.shade700
                        : Colors.grey.shade100,
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                  ),
                  errorWidget: (_, __, ___) => Icon(
                    Icons.catching_pokemon,
                    size: 48,
                    color: context.textSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TypeBadge extends StatelessWidget {
  const _TypeBadge({required this.type, required this.color});
  final String type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: context.isDark ? 0.30 : 0.22),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${type[0].toUpperCase()}${type.substring(1)}',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: context.isDark ? color.withValues(alpha: 0.9) : color,
        ),
      ),
    );
  }
}
