import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/core/widgets/pokeball_loader.dart';
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
            actions: [
              FavoriteButton(
                isFavorite: isFavorite,
                onToggle: () =>
                    ref.read(favoritesProvider.notifier).toggle(detail),
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
                    style: GoogleFonts.outfit(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: isDark
                          ? AppColorsDark.textPrimary
                          : AppColors.textDark,
                      height: 1.0,
                    ),
                  ),
                  Text(
                    detail.formattedId,
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDark
                          ? AppColorsDark.textSecondary
                          : AppColors.textMedium,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ── Type Chips ────────────────────────────────────────────
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.types
                        .map((t) => PokemonTypeChip(type: t))
                        .toList(),
                  ),
                  const SizedBox(height: 20),

                  // ── Description ───────────────────────────────────────────
                  Text(
                    detail.description,
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppColorsDark.textSecondary
                          : AppColors.textMedium,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Weight / Height ───────────────────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: _InfoCard(
                          label: l10n.detailWeight.toUpperCase(),
                          value: detail.weightFormatted,
                          icon: Icons.monitor_weight_outlined,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _InfoCard(
                          label: l10n.detailHeight.toUpperCase(),
                          value: detail.heightFormatted,
                          icon: Icons.straighten_rounded,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // ── Category / Ability ────────────────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: _InfoCard(
                          label: l10n.detailCategory,
                          value: detail.category
                              .replaceAll(' Pokémon', '')
                              .toUpperCase(),
                          icon: Icons.category_outlined,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _InfoCard(
                          label: l10n.detailAbility,
                          value: detail.primaryAbility,
                          icon: Icons.flash_on_rounded,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // ── Gender ────────────────────────────────────────────────
                  if (detail.genderRate != -1) ...[
                    _SectionTitle(label: l10n.detailGender, isDark: isDark),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _GenderBar(genderRate: detail.genderRate),
                        const SizedBox(height: 6),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ── Unified animated gender bar ───────────────
                            LinearPercentIndicator(
                              animation: true,
                              padding: EdgeInsets.zero,
                              animationDuration: 1000,
                              lineHeight: 8.0,
                              percent: detail.malePct / 100,
                              barRadius: const Radius.circular(50),
                              progressColor: const Color(0xFF2551C3),
                              backgroundColor: const Color(0xFFFF7596),
                            ),
                            const SizedBox(height: 6),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.male_rounded,
                                      size: 16,
                                      color: Color(0xFF1E88E5),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${detail.malePct}%',
                                      style: GoogleFonts.outfit(
                                        fontSize: 12,
                                        color: isDark
                                            ? AppColorsDark.textSecondary
                                            : AppColors.textMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${detail.femalePct}%',
                                      style: GoogleFonts.outfit(
                                        fontSize: 12,
                                        color: isDark
                                            ? AppColorsDark.textSecondary
                                            : AppColors.textMedium,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.female_rounded,
                                      size: 16,
                                      color: Color(0xFFE91E63),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                  ],

                  // ── Weaknesses ────────────────────────────────────────────
                  if (detail.weaknesses.isNotEmpty) ...[
                    _SectionTitle(label: l10n.detailWeaknesses, isDark: isDark),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: detail.weaknesses
                          .map((w) => PokemonTypeChip(type: w))
                          .toList(),
                    ),
                    const SizedBox(height: 28),
                  ],

                  // ── Base Stats ────────────────────────────────────────────
                  _SectionTitle(label: l10n.detailBaseStats, isDark: isDark),
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
                  const SizedBox(height: 40),
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
            top: -200,
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
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Hero(
                  tag: 'pokemon-${detail.id}',
                  child: CachedNetworkImage(
                    imageUrl: detail.imageUrl ?? '',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Info Card ─────────────────────────────────────────────────────────────────
class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.label,
    required this.value,
    required this.icon,
  });
  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? AppColorsDark.surfaceVar : AppColors.gray10,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColorsDark.cardBorder : AppColors.gray30,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 14,
                color: isDark
                    ? AppColorsDark.textSecondary
                    : AppColors.textMedium,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: GoogleFonts.outfit(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                  color: isDark
                      ? AppColorsDark.textSecondary
                      : AppColors.textMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.outfit(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Gender Bar ────────────────────────────────────────────────────────────────
class _GenderBar extends StatelessWidget {
  const _GenderBar({required this.genderRate});
  final int genderRate;

  @override
  Widget build(BuildContext context) {
    final femaleFraction = genderRate / 8.0;
    final maleFraction = 1.0 - femaleFraction;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 8,
        child: Row(
          children: [
            Expanded(
              flex: (maleFraction * 100).toInt(),
              child: ColoredBox(color: const Color(0xFF1E88E5)),
            ),
            Expanded(
              flex: (femaleFraction * 100).toInt(),
              child: ColoredBox(color: const Color(0xFFE91E63)),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Section Title ─────────────────────────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.label, required this.isDark});
  final String label;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.outfit(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
      ),
    );
  }
}
