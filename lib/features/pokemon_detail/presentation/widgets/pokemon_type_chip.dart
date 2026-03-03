import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

class PokemonTypeChip extends StatelessWidget {
  const PokemonTypeChip({required this.type, super.key});
  final String type;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.forType(type);
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${type[0].toUpperCase()}${type.substring(1)}',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}
