import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/l10n/generated/app_localizations.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

class PokemonTypeChip extends StatelessWidget {
  const PokemonTypeChip({required this.type, super.key});
  final String type;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.forType(type);
    final iconPath = 'assets/categories/category_${type.toLowerCase()}.png';

    final l10n = AppLocalizations.of(context);
    final label = _getTranslation(type, l10n);

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

  String _getTranslation(String type, AppLocalizations l10n) {
    final t = type.toLowerCase();
    switch (t) {
      case 'bug':
        return l10n.typeBug;
      case 'dark':
        return l10n.typeDark;
      case 'dragon':
        return l10n.typeDragon;
      case 'electric':
        return l10n.typeElectric;
      case 'fairy':
        return l10n.typeFairy;
      case 'fighting':
        return l10n.typeFighting;
      case 'fire':
        return l10n.typeFire;
      case 'flying':
        return l10n.typeFlying;
      case 'ghost':
        return l10n.typeGhost;
      case 'grass':
        return l10n.typeGrass;
      case 'ground':
        return l10n.typeGround;
      case 'ice':
        return l10n.typeIce;
      case 'normal':
        return l10n.typeNormal;
      case 'poison':
        return l10n.typePoison;
      case 'psychic':
        return l10n.typePsychic;
      case 'rock':
        return l10n.typeRock;
      case 'steel':
        return l10n.typeSteel;
      case 'water':
        return l10n.typeWater;
      default:
        return '${t[0].toUpperCase()}${t.substring(1)}';
    }
  }
}
