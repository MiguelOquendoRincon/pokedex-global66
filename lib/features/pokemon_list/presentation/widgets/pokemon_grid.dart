import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_summary.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_list_provider.dart';
import 'pokemon_card.dart';

class PokemonGrid extends ConsumerWidget {
  const PokemonGrid({
    required this.pokemon,
    required this.typeFilter,
    required this.isLoadingMore,
    required this.hasReachedEnd,
    required this.onLoadMore,
    super.key,
  });

  final List<PokemonSummary> pokemon;
  final String typeFilter;
  final bool isLoadingMore;
  final bool hasReachedEnd;
  final VoidCallback onLoadMore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeCache = ref.watch(pokemonTypeCacheProvider);

    // Apply type filter using the cache (populated lazily by cards).
    final filtered = typeFilter.isEmpty
        ? pokemon
        : pokemon.where((p) => typeCache[p.name] == typeFilter).toList();

    return NotificationListener<ScrollNotification>(
      onNotification: (n) {
        if (n is ScrollEndNotification &&
            n.metrics.extentAfter < 200 &&
            !isLoadingMore &&
            !hasReachedEnd) {
          onLoadMore();
        }
        return false;
      },
      child: GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.4,
        ),
        itemCount: filtered.length + (isLoadingMore ? 2 : 0),
        itemBuilder: (context, i) {
          if (i >= filtered.length) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }
          return PokemonCard(pokemon: filtered[i]);
        },
      ),
    );
  }
}
