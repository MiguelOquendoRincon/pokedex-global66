import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

/// Ergonomic context extension so widgets write `context.colors.cardBg`
/// instead of long Theme.of(context) chains.
extension AppThemeX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  /// Background behind the Pokémon list content area.
  Color get contentBg =>
      isDark ? AppColorsDark.surface : const Color(0xFFEFEFEF);

  /// Card background.
  Color get cardBg => isDark ? AppColorsDark.surfaceVar : AppColors.surface;

  /// Primary text.
  Color get textPrimary =>
      isDark ? AppColorsDark.textPrimary : AppColors.textDark;

  /// Secondary / hint text.
  Color get textSecondary =>
      isDark ? AppColorsDark.textSecondary : AppColors.textMedium;

  /// Search bar / input fill.
  Color get inputFill => isDark ? AppColorsDark.inputFill : Colors.white;

  /// Border color.
  Color get borderColor =>
      isDark ? AppColorsDark.darkBorder : AppColors.lightBorder;

  /// Border color focus.
  Color get focusBorderColor =>
      isDark ? AppColorsDark.darkBorderFocus : AppColors.lightBorderFocus;

  /// Border color hover.
  Color get hoverBorderColor =>
      isDark ? AppColorsDark.darkBorderHover : AppColors.lightBorderHover;

  /// Border color pressed.
  Color get pressedBorderColor =>
      isDark ? AppColorsDark.darkBorderPressed : AppColors.lightBorderPressed;

  /// Border color disabled.
  Color get disabledBorderColor =>
      isDark ? AppColorsDark.darkBorderDisabled : AppColors.lightBorderDisabled;

  /// Subtle icon / watermark overlay.
  Color get watermarkColor => isDark
      ? Colors.white.withValues(alpha: 0.04)
      : Colors.black.withValues(alpha: 0.05);
}
