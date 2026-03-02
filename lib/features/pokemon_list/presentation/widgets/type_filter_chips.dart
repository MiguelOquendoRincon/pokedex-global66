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
      height: 36,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: [
          // "All" chip
          _TypeChip(
            label: 'All',
            color: AppColors.textDark,
            isSelected: selectedType.isEmpty,
            onTap: () => onSelected(''),
          ),
          ..._types.map(
            (t) => _TypeChip(
              label: _capitalize(t),
              color: AppColors.forType(t),
              isSelected: selectedType == t,
              onTap: () => onSelected(selectedType == t ? '' : t),
            ),
          ),
        ],
      ),
    );
  }

  String _capitalize(String s) =>
      s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({
    required this.label,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? color
              : AppColors.onPrimary.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : color,
          ),
        ),
      ),
    );
  }
}
