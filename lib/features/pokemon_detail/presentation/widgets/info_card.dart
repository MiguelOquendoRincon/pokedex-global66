// ── Info Card ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
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
    return Column(
      spacing: 4.5,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: isDark
                  ? AppColorsDark.textSecondary
                  : AppColors.textMedium,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            color: isDark ? AppColorsDark.surfaceVar : AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? AppColorsDark.cardBorder : AppColors.gray30,
              width: 1,
            ),
          ),
          width: double.infinity,
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
