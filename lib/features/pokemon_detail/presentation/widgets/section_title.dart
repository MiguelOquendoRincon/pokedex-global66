// ── Section Title ─────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.label, this.style});
  final String label;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style:
          style ??
          context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
    );
  }
}
