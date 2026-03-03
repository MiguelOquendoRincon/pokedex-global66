import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:shimmer/shimmer.dart';

class PokemonListSkeleton extends StatelessWidget {
  const PokemonListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = context.isDark
        ? Colors.grey.shade800
        : Colors.grey.shade300;
    final highlightColor = context.isDark
        ? Colors.grey.shade700
        : Colors.grey.shade100;

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (_, __) => Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: const _SkeletonCard(),
      ),
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  const _SkeletonCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      height: 115,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // ── Left: text placeholders ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 0, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Number placeholder
                Container(
                  width: 36,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(height: 8),

                // Name placeholder
                Container(
                  width: 110,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(height: 10),

                // Type chip placeholder
                Container(
                  width: 60,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ],
            ),
          ),

          // ── Top-right: heart button placeholder ───────────────────────
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // ── Right: image circle placeholder ───────────────────────────
          const Positioned(
            right: 14,
            top: 0,
            bottom: 0,
            child: Center(child: _CirclePlaceholder(size: 88)),
          ),
        ],
      ),
    );
  }
}

class _CirclePlaceholder extends StatelessWidget {
  const _CirclePlaceholder({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}
