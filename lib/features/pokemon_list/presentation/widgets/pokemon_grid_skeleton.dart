import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:shimmer/shimmer.dart';

class PokemonGridSkeleton extends StatelessWidget {
  const PokemonGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = context.isDark
        ? Colors.grey.shade800
        : Colors.grey.shade200;
    final highlightColor = context.isDark
        ? Colors.grey.shade700
        : Colors.grey.shade50;

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.4,
      ),
      itemCount: 10,
      itemBuilder: (_, __) => Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          decoration: BoxDecoration(
            color: context.cardBg,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
