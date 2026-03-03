import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/features/pokemon_detail/presentation/widgets/section_title.dart';

class GenderBar extends StatelessWidget {
  const GenderBar({super.key, required this.genderRate});
  final int genderRate;

  double get malePct => (8 - genderRate) * 12.5;
  double get femalePct => genderRate * 12.5;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        SectionTitle(
          label: l10n.detailGender,
          style: context.textTheme.bodySmall?.copyWith(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _GenderBar(genderRate: genderRate),
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
                  percent: malePct / 100,
                  barRadius: const Radius.circular(50),
                  progressColor: context.maleColor,
                  backgroundColor: context.femaleColor,
                ),
                const SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 4.0,
                      children: [
                        Icon(
                          Icons.male_rounded,
                          size: 16,
                          color: context.maleColor,
                        ),
                        Text(
                          '$malePct%',
                          style: context.textTheme.titleMedium?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 4.0,
                      children: [
                        Icon(
                          Icons.female_rounded,
                          size: 16,
                          color: context.femaleColor,
                        ),
                        Text(
                          '$femalePct%',
                          style: context.textTheme.titleMedium?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
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
              child: ColoredBox(color: context.maleColor),
            ),
            Expanded(
              flex: (femaleFraction * 100).toInt(),
              child: ColoredBox(color: context.femaleColor),
            ),
          ],
        ),
      ),
    );
  }
}
