import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    required this.count,
    required this.current,
    super.key,
  });

  final int count;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 28 : 9,
          height: 9,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primaryDark
                : AppColors.primary.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
