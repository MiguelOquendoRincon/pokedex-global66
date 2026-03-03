import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/core/widgets/pokeball_loader.dart';
import 'package:pokedex_global66/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:pokedex_global66/features/pokemon_detail/domain/entities/pokemon_details.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/providers/pokemon_detail_provider.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/favorite_button.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/gender_bar.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/info_card.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/pokemon_stats_bar.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/pokemon_type_chip.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/section_title.dart';

/// A screen that displays the complete details of a specific Pokémon.
///
/// It shows the Pokémon's image, name, types, description, physical
/// characteristics, abilities, weaknesses, and base stats. It also allows
/// toggling the Pokémon's favorite status.
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

// ── Loading ───────────────────────────────────────────────────────────────────
class _LoadingView extends StatelessWidget {
  const _LoadingView();
  @override
  Widget build(BuildContext context) => const FullScreenLoader();
}

// ── Error ─────────────────────────────────────────────────────────────────────
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

// ── Detail ────────────────────────────────────────────────────────────────────
class _DetailView extends ConsumerWidget {
  const _DetailView({required this.detail});
  final PokemonDetail detail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final typeColor = AppColors.forType(detail.primaryType);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isFavorite = ref.watch(
      favoritesProvider.select((favs) => favs.any((f) => f.id == detail.id)),
    );

    return Scaffold(
      backgroundColor: isDark ? AppColorsDark.background : AppColors.white,
      body: CustomScrollView(
        slivers: [
          // ── SliverAppBar ──────────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 300,
            backgroundColor: typeColor,
            foregroundColor: Colors.white,
            pinned: true,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(CupertinoIcons.chevron_left),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 4.0),
                child: FavoriteButton(
                  isFavorite: isFavorite,
                  onToggle: () =>
                      ref.read(favoritesProvider.notifier).toggle(detail),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: _HeaderBackground(
                typeColor: typeColor,
                detail: detail,
              ),
            ),
          ),

          // ── White rounded content card ────────────────────────────────────
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: isDark ? AppColorsDark.surface : Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Name + Number ─────────────────────────────────────────
                  Text(
                    detail.displayName,
                    style: context.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    detail.formattedId.replaceAll('#', 'Nº'),
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Type Chips ────────────────────────────────────────────
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.types
                        .map((t) => PokemonTypeChip(type: t))
                        .toList(),
                  ),
                  const SizedBox(height: 24),

                  // ── Description ───────────────────────────────────────────
                  Text(detail.description, style: context.textTheme.bodyMedium),
                  const SizedBox(height: 18),

                  Divider(color: context.borderColor, thickness: 1),

                  const SizedBox(height: 18),
                  // ── Weight / Height ───────────────────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: InfoCard(
                          label: l10n.detailWeight.toUpperCase(),
                          value: detail.weightFormatted,
                          icon: Icons.monitor_weight_outlined,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InfoCard(
                          label: l10n.detailHeight.toUpperCase(),
                          value: detail.heightFormatted,
                          icon: Icons.height_rounded,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ── Category / Ability ────────────────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: InfoCard(
                          label: l10n.detailCategory,
                          value: detail.category
                              .replaceAll('Pokémon', '')
                              .toUpperCase(),
                          icon: Icons.category_outlined,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InfoCard(
                          label: l10n.detailAbility,
                          value: detail.primaryAbility,
                          icon: Icons.catching_pokemon_rounded,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),

                  // ── Gender ────────────────────────────────────────────────
                  if (detail.genderRate != -1) ...[
                    GenderBar(genderRate: detail.genderRate),
                    const SizedBox(height: 41),
                  ],

                  // ── Weaknesses ────────────────────────────────────────────
                  if (detail.weaknesses.isNotEmpty) ...[
                    SectionTitle(label: l10n.detailWeaknesses),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: detail.weaknesses
                          .map((w) => PokemonTypeChip(type: w))
                          .toList(),
                    ),
                    const SizedBox(height: 41),
                  ],

                  // ── Base Stats ────────────────────────────────────────────
                  SectionTitle(label: l10n.detailBaseStats),
                  const SizedBox(height: 12),
                  Column(
                    children: detail.stats.entries
                        .map(
                          (e) => PokemonStatsBar(
                            label: l10n.localiseStatName(e.key),
                            value: e.value,
                            color: typeColor,
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Hero Header Background ─────────────────────────────────────────────────────
class _HeaderBackground extends StatelessWidget {
  const _HeaderBackground({required this.typeColor, required this.detail});
  final Color typeColor;
  final PokemonDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.isDark ? AppColorsDark.background : AppColors.white,
      child: Stack(
        children: [
          // Large translucent type blob
          Positioned(
            top: -180,
            left: -20,
            child: CircleAvatar(
              backgroundColor: typeColor,
              radius: 230,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    // Category Icon
                    Positioned(
                      top: 100,
                      child: Image.asset(
                        'assets/categories/category_${detail.primaryType.toLowerCase()}.png',
                        width: 200,
                        height: 200,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Pokemon image
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.only(top: 90),
              alignment: Alignment.bottomCenter,
              child: Hero(
                tag: 'pokemon-${detail.id}',
                child: CachedNetworkImage(
                  imageUrl: detail.imageUrl ?? '',
                  height: 220,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
