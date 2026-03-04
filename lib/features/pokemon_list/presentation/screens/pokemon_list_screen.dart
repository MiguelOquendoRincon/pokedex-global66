// ══════════════════════════════════════════════════════════════════════════════
// screens/pokemon_list_screen.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_preview.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_list_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_card.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_list_skeleton.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_list_error.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_search_bar.dart';

/// The main screen of the application that displays a list of Pokémon.
///
/// It supports pagination, search filtering by name, and type filtering (both
/// through a chip row and a bottom sheet). It handles initial loading,
/// errors, and pagination states.
class PokemonListScreen extends ConsumerWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pokemonListProvider);
    final typeCache = ref.watch(pokemonTypeCacheProvider);
    final l10n = context.l10n;

    // ── Filtering ─────────────────────────────────────────────────────────
    final filtered = state.previews.where((p) {
      // 1. Name filter
      if (state.searchQuery.isNotEmpty) {
        if (!p.name.toLowerCase().contains(state.searchQuery.toLowerCase())) {
          return false;
        }
      }

      final actualTypes = typeCache[p.name] ?? p.types;

      // 2. Single-type chip filter (chip row)
      if (state.selectedType.isNotEmpty) {
        if (!actualTypes.contains(state.selectedType)) return false;
      }

      // 3. Multi-type filter (bottom sheet) — must match at least one type
      if (state.selectedTypes.isNotEmpty) {
        if (!state.selectedTypes.any(actualTypes.contains)) return false;
      }

      return true;
    }).toList();

    return Scaffold(
      backgroundColor: context.contentBg,
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (n) {
            if (n is ScrollEndNotification &&
                n.metrics.extentAfter < 200 &&
                !state.isLoadingMore &&
                !state.hasReachedEnd) {
              ref.read(pokemonListProvider.notifier).fetchMore();
            }
            return false;
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 28.0)),

              // ── Search bar ───────────────────────────────────────────────
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverToBoxAdapter(
                  child: PokemonSearchBar(
                    hint: l10n.searchHint,
                    searchQuery: state.searchQuery,
                    initialFilters: state.selectedTypes,
                    onChanged: (q) =>
                        ref.read(pokemonListProvider.notifier).updateSearch(q),
                    onFiltersChanged: (types) => ref
                        .read(pokemonListProvider.notifier)
                        .updateTypeFilters(types),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),

              // ── Filter Status ──────────────────────────────────────────────
              if (state.hasActiveFilters)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: l10n.resultsFound(filtered.length),
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.textSecondary,
                              ),
                            ),
                            TextSpan(
                              text: l10n.resultsCount(filtered.length),
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: context.textSecondary,
                              ),
                            ),
                            const TextSpan(text: ' '),
                            // Subrayado en azul
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () => ref
                                    .read(pokemonListProvider.notifier)
                                    .clearFilters(),
                                child: Text(
                                  l10n.clearFilter,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w700,
                                    decorationColor: AppColors.primary,
                                    decorationThickness: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              // ── Content ──────────────────────────────────────────────────
              ..._buildSlivers(context, ref, state, filtered, typeCache),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSlivers(
    BuildContext context,
    WidgetRef ref,
    PokemonListState state,
    List<PokemonPreview> filtered,
    Map<String, List<String>> typeCache,
  ) {
    if (state.isInitialLoading) {
      return [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const PokemonListSkeletonItem(),
              childCount: 8,
            ),
          ),
        ),
      ];
    }

    if (state.error != null && state.previews.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: PokemonListError(
            exception: state.error!,
            onRetry: () => ref.read(pokemonListProvider.notifier).retry(),
          ),
        ),
      ];
    }

    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, i) {
            final pokemon = filtered[i];
            // Fix: Pass the cached types from the screen to ensures the card
            // constructor parameters change when data arrives, forcing a rebuild.
            // Also add a stable ValueKey to help with widget identification.
            final actualTypes = typeCache[pokemon.name] ?? pokemon.types;
            return PokemonCard(
              key: ValueKey(pokemon.id),
              pokemon: pokemon,
              types: actualTypes,
            );
          }, childCount: filtered.length),
        ),
      ),
      if (state.isLoadingMore)
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const PokemonListSkeletonItem(),
              childCount: 2,
            ),
          ),
        ),
    ];
  }
}
