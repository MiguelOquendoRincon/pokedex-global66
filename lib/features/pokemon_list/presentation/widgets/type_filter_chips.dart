import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

class TypeFilterChips extends StatelessWidget {
  const TypeFilterChips({
    required this.selectedType,
    required this.onSelected,
    super.key,
  });

  final String selectedType;
  final ValueChanged<String> onSelected;

  static const _types = [
    'fire',
    'water',
    'grass',
    'electric',
    'psychic',
    'ice',
    'dragon',
    'dark',
    'fairy',
    'fighting',
    'flying',
    'poison',
    'ground',
    'rock',
    'bug',
    'ghost',
    'steel',
    'normal',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48, // Increased height for the new pill design
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _types.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _TypeFilterChip(
              type: '',
              label: 'All',
              color: AppColors.textDark,
              isSelected: selectedType.isEmpty,
              onTap: () => onSelected(''),
            );
          }
          final t = _types[index - 1];
          return _TypeFilterChip(
            type: t,
            label: _getTranslation(t),
            color: AppColors.forType(t),
            isSelected: selectedType == t,
            onTap: () => onSelected(selectedType == t ? '' : t),
          );
        },
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
    return translations[type.toLowerCase()] ?? type;
  }
}

class _TypeFilterChip extends StatelessWidget {
  const _TypeFilterChip({
    required this.type,
    required this.label,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  final String type;
  final String label;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final iconPath = type.isEmpty
        ? null
        : 'assets/categories/category_$type.png';

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(right: 10, bottom: 4, top: 4),
        padding: const EdgeInsets.fromLTRB(4, 4, 14, 4),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? color : color.withValues(alpha: 0.2),
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: iconPath == null
                  ? Icon(
                      Icons.apps,
                      size: 14,
                      color: isSelected ? color : AppColors.textDark,
                    )
                  : Image.asset(
                      iconPath,
                      width: 14,
                      height: 14,
                      color: isSelected ? color : color,
                    ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : color,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
