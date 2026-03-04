import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool _isPrimary;

  const CustomButton._({
    super.key,
    required this.onPressed,
    required this.text,
    required bool isPrimary,
  }) : _isPrimary = isPrimary;

  /// Primary constructor
  factory CustomButton.primary({
    Key? key,
    required VoidCallback? onPressed,
    required String text,
  }) {
    return CustomButton._(
      key: key,
      onPressed: onPressed,
      text: text,
      isPrimary: true,
    );
  }

  /// Secondary constructor
  factory CustomButton.secondary({
    Key? key,
    required VoidCallback? onPressed,
    required String text,
  }) {
    return CustomButton._(
      key: key,
      onPressed: onPressed,
      text: text,
      isPrimary: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isPrimary
        ? AppColors.primary
        : AppColorsDark.textPrimary;

    final foregroundColor = _isPrimary
        ? AppColors.onPrimary
        : context.textPrimary;

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
