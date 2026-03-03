import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

class PokemonTypeChip extends StatelessWidget {
  const PokemonTypeChip({required this.type, super.key});
  final String type;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.forType(type);
    final iconPath = 'assets/categories/category_${type.toLowerCase()}.png';

    // Simple translation mapping since these are not in ARB files yet.
    // This allows the UI to match the provided design exactly.
    final label = _getTranslation(type);

    return Container(
      padding: const EdgeInsets.fromLTRB(4, 4, 12, 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // White Icon Container
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              iconPath,
              width: 14,
              height: 14,
              // Fallback color in case some assets are missing/colored differently
              color: color,
              errorBuilder: (_, __, ___) =>
                  const SizedBox(width: 14, height: 14),
            ),
          ),
          const SizedBox(width: 8),

          // Type Name
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  String _getTranslation(String type) {
    final Map<String, String> translations = {
      'bug': 'Bicho',
      'dark': 'Siniestro',
      'dragon': 'Dragón',
      'electric': 'Eléctrico',
      'fairy': 'Hada',
      'fighting': 'Lucha',
      'fire': 'Fuego',
      'flying': 'Volador',
      'ghost': 'Fantasma',
      'grass': 'Planta',
      'ground': 'Tierra',
      'ice': 'Hielo',
      'normal': 'Normal',
      'poison': 'Veneno',
      'psychic': 'Psíquico',
      'rock': 'Roca',
      'steel': 'Acero',
      'water': 'Agua',
    };

    final t = type.toLowerCase();
    return translations[t] ?? '${t[0].toUpperCase()}${t.substring(1)}';
  }
}
