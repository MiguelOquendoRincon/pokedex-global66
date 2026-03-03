// ══════════════════════════════════════════════════════════════════════════════
// features/onboarding/presentation/widgets/onboarding_page_widget.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

class OnboardingPageWidget extends StatelessWidget {
  const OnboardingPageWidget({
    required this.imagePath,
    required this.title,
    required this.description,
    super.key,
  });

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Pokéball-framed illustration
          Container(
            width: 342,
            height: 342,
            decoration: const BoxDecoration(
              color: AppColors.onPrimary,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
