// ══════════════════════════════════════════════════════════════════════════════
// screens/pokemon_list_screen.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/features/pokemon_list/domain/entities/pokemon_preview.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_list_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_type_cache_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_card.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_list_skeleton.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_list_error.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_search_bar.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/type_filter_chips.dart';

class PokemonListScreen extends ConsumerWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pokemonListProvider);
    final typeCache = ref.watch(pokemonTypeCacheProvider);
    final l10n = context.l10n;

    // Perform filtering here in the UI layer using the live type cache.
    // This ensures that if a Pokémon's types are updated (e.g. from the detail screen),
    // the list filter responds immediately even if the previews haven't refreshed.
    final filtered = state.previews.where((p) {
      // 1. Name filter
      if (state.searchQuery.isNotEmpty) {
        if (!p.name.toLowerCase().contains(state.searchQuery.toLowerCase())) {
          return false;
        }
      }

      // 2. Type filter
      if (state.selectedType.isNotEmpty) {
        final actualTypes = typeCache[p.name] ?? p.types;
        if (!actualTypes.contains(state.selectedType)) {
          return false;
        }
      }

      return true;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.onPrimary,
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
                    onChanged: (q) =>
                        ref.read(pokemonListProvider.notifier).updateSearch(q),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),

              // ── Type filter chips ────────────────────────────────────────
              SliverToBoxAdapter(
                child: TypeFilterChips(
                  selectedType: state.selectedType,
                  onSelected: (t) => ref
                      .read(pokemonListProvider.notifier)
                      .updateTypeFilter(t),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              // ── Content ──────────────────────────────────────────────────
              ..._buildSlivers(context, ref, state, filtered),

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
            return PokemonCard(pokemon: pokemon, types: pokemon.types);
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
