import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_global66/core/router/app_router.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/providers/pokemon_detail_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';

class PokemonCard extends ConsumerWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.primaryType,
  });

  final PokemonSummary pokemon;
  final String primaryType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // If the cache doesn't have the type, watch the detail provider.
    // This will trigger the load and populate the cache.
    final detailState = primaryType.isEmpty
        ? ref.watch(pokemonDetailProvider(pokemon.name))
        : null;

    final typeToUse = primaryType.isNotEmpty
        ? primaryType
        : detailState?.detail?.primaryType ?? '';

    final typeColor = typeToUse.isNotEmpty
        ? AppColors.forType(typeToUse)
        : const Color(0xFF9E9E9E);

    final favorites = ref.watch(favoritesProvider);
    final isFavorite = favorites.any((f) => f.id == pokemon.id);

    return GestureDetector(
      onTap: () => context.go('${AppRoutes.pokedex}/detail/${pokemon.name}'),
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        height: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [typeColor, typeColor.withValues(alpha: 0.80)],
          ),
          boxShadow: [
            BoxShadow(
              color: typeColor.withValues(alpha: 0.40),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            // ── Subtle pokéball watermark ──────────────────────────────
            Positioned(
              right: 100,
              top: -22,
              child: Icon(
                Icons.catching_pokemon,
                size: 130,
                color: Colors.white.withValues(alpha: 0.07),
              ),
            ),

            // ── Left: text info ────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 14, 0, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Number
                  Text(
                    pokemon.formattedId,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.70),
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Name
                  Text(
                    pokemon.displayName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Type chips
                  if (typeToUse.isNotEmpty) _TypeChip(type: typeToUse),
                ],
              ),
            ),

            // ── Top-right: favourite button ────────────────────────────
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  if (typeToUse.isEmpty) return; // Wait for type info
                  ref
                      .read(favoritesProvider.notifier)
                      .toggleFromList(
                        id: pokemon.id,
                        name: pokemon.name,
                        primaryType: typeToUse,
                      );
                },
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.22),
                    shape: BoxShape.circle,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, anim) =>
                        ScaleTransition(scale: anim, child: child),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      key: ValueKey(isFavorite),
                      size: 18,
                      color: isFavorite ? Colors.red.shade300 : Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // ── Right: Pokémon image inside translucent circle ─────────
            Positioned(
              right: 14,
              bottom: 0,
              top: 0,
              child: Center(
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    shape: BoxShape.circle,
                  ),
                  child: Hero(
                    tag: 'pokemon-${pokemon.id}',
                    child: CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      fit: BoxFit.contain,
                      fadeInDuration: const Duration(milliseconds: 200),
                      errorWidget: (_, __, ___) => Icon(
                        Icons.catching_pokemon,
                        size: 44,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
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

// ── Type chip ─────────────────────────────────────────────────────────────────

class _TypeChip extends StatelessWidget {
  const _TypeChip({required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    final label = type.isEmpty
        ? ''
        : '${type[0].toUpperCase()}${type.substring(1)}';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
