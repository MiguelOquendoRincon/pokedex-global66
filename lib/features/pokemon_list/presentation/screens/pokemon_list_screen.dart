// ══════════════════════════════════════════════════════════════════════════════
// screens/pokemon_list_screen.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_list_provider.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_grid.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_grid_skeleton.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_list_error.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_search_bar.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/type_filter_chips.dart';

class PokemonListScreen extends ConsumerWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pokemonListProvider);
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Text(
                l10n.appTitle,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onPrimary,
                  fontFamily: 'PokemonSolid',
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ── Search bar ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PokemonSearchBar(
                hint: l10n.searchHint,
                onChanged: (q) =>
                    ref.read(pokemonListProvider.notifier).updateSearch(q),
              ),
            ),
            const SizedBox(height: 12),

            // ── Type filter chips ────────────────────────────────────────
            TypeFilterChips(
              selectedType: state.selectedType,
              onSelected: (t) =>
                  ref.read(pokemonListProvider.notifier).updateTypeFilter(t),
            ),
            const SizedBox(height: 8),

            // ── Content ──────────────────────────────────────────────────
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: _buildContent(context, ref, state),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    PokemonListState state,
  ) {
    if (state.isInitialLoading) return const PokemonGridSkeleton();

    if (state.error != null && state.allPokemon.isEmpty) {
      return PokemonListError(
        exception: state.error!,
        onRetry: () => ref.read(pokemonListProvider.notifier).retry(),
      );
    }

    return PokemonGrid(
      pokemon: state.filtered,
      typeFilter: state.selectedType,
      isLoadingMore: state.isLoadingMore,
      hasReachedEnd: state.hasReachedEnd,
      onLoadMore: () => ref.read(pokemonListProvider.notifier).fetchMore(),
    );
  }
}
