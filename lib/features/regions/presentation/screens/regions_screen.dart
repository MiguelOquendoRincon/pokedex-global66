import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/icons_svg.dart';

/// A placeholder screen for the upcoming "Regions" feature.
///
/// It currently displays a "Coming Soon" message with a relevant image.
class RegionsScreen extends StatelessWidget {
  const RegionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: context.contentBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image Section
              Image.asset(
                CustomIcons.regions,
                width: 250,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.map_rounded,
                    size: 120,
                    color: AppColors.primary.withValues(alpha: 0.2),
                  );
                },
              ),
              const SizedBox(height: 48),

              // Title Section
              Text(
                l10n.regionsComingSoon,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              // Subtitle Section
              Text(
                l10n.regionsComingSoonSubtitle,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
