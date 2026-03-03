import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/pokemon_details.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/providers/pokemon_detail_provider.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/favorite_button.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/pokemon_stats_bar.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/pokemon_type_chip.dart';

class PokemonDetailScreen extends ConsumerWidget {
  const PokemonDetailScreen({required this.pokemonName, super.key});
  final String pokemonName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pokemonDetailProvider(pokemonName));

    return Scaffold(
      body: switch (state) {
        PokemonDetailState(isLoading: true) => const _LoadingView(),
        PokemonDetailState(error: final e?) => _ErrorView(
          exception: e,
          onRetry: () =>
              ref.read(pokemonDetailProvider(pokemonName).notifier).retry(),
        ),
        PokemonDetailState(detail: final d?) => _DetailView(detail: d),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

// ── Loading ──────────────────────────────────────────────────────────────────
class _LoadingView extends StatelessWidget {
  const _LoadingView();
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

// ── Error ────────────────────────────────────────────────────────────────────
class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.exception, required this.onRetry});
  final AppException exception;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final message = switch (exception) {
      NoInternetException() => l10n.errorNoInternet,
      NotFoundException() => l10n.errorNotFound,
      TimeoutException() => l10n.errorTimeout,
      _ => l10n.errorGeneric,
    };
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          FilledButton(onPressed: onRetry, child: Text(l10n.retryButton)),
        ],
      ),
    );
  }
}

// ── Detail ───────────────────────────────────────────────────────────────────
class _DetailView extends ConsumerWidget {
  const _DetailView({required this.detail});
  final PokemonDetail detail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final typeColor = AppColors.forType(detail.primaryType);
    final isFavorite = ref.watch(
      favoritesProvider.select((favs) => favs.any((f) => f.id == detail.id)),
    );

    return Scaffold(
      backgroundColor: typeColor.withValues(alpha: 0.15),
      body: CustomScrollView(
        slivers: [
          // ── SliverAppBar ────────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 260,
            backgroundColor: typeColor,
            foregroundColor: Colors.white,
            pinned: true,
            actions: [
              FavoriteButton(
                isFavorite: isFavorite,
                onToggle: () =>
                    ref.read(favoritesProvider.notifier).toggle(detail),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                detail.displayName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              background: Stack(
                alignment: Alignment.center,
                children: [
                  // Pokéball watermark
                  Opacity(
                    opacity: 0.15,
                    child: Icon(
                      Icons.catching_pokemon,
                      size: 220,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    child: Hero(
                      tag: 'pokemon-${detail.id}',
                      child: CachedNetworkImage(
                        imageUrl: detail.imageUrl ?? '',
                        height: 160,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: Text(
                      detail.formattedId,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Body ─────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Types
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.types
                        .map((t) => PokemonTypeChip(type: t))
                        .toList(),
                  ),
                  const SizedBox(height: 24),

                  // About section
                  _SectionTitle(label: l10n.detailAbout),
                  const SizedBox(height: 12),
                  _AboutRow(
                    items: [
                      (l10n.detailHeight, detail.heightFormatted),
                      (l10n.detailWeight, detail.weightFormatted),
                      (l10n.detailBaseExp, '${detail.baseExperience}'),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Base Stats
                  _SectionTitle(label: l10n.detailBaseStats),
                  const SizedBox(height: 12),
                  ...detail.stats.entries.map(
                    (e) => PokemonStatsBar(
                      label: _localiseStatName(e.key, l10n),
                      value: e.value,
                      color: typeColor,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Abilities
                  _SectionTitle(label: l10n.detailAbilities),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.abilities
                        .map(
                          (a) => Chip(
                            label: Text(
                              '${a[0].toUpperCase()}${a.substring(1)}',
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _localiseStatName(String key, dynamic l10n) => switch (key) {
    'hp' => l10n.statHp,
    'attack' => l10n.statAttack,
    'defense' => l10n.statDefense,
    'special-attack' => l10n.statSpAtk,
    'special-defense' => l10n.statSpDef,
    'speed' => l10n.statSpeed,
    _ => key,
  };
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.textDark,
      ),
    );
  }
}

class _AboutRow extends StatelessWidget {
  const _AboutRow({required this.items});
  final List<(String, String)> items;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items
          .map(
            (i) => Column(
              children: [
                Text(
                  i.$2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  i.$1,
                  style: const TextStyle(
                    color: AppColors.textMedium,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
