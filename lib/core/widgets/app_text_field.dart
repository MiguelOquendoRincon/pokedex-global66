import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/tokens/accesibility.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/core/utils/text_styles/global_text_styles.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSubmitted;

  const AppTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.label,
    required this.hint,
    required this.keyboardType,
    required this.textInputAction,
    this.obscureText = false,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isFocused = focusNode.hasFocus;
    final Color borderColor = errorText != null
        ? AppColors.red70
        : (isFocused ? AppColors.orange50 : theme.dividerColor);

    return Semantics(
      textField: true,
      label: label,
      value: controller.text,
      hint: hint,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(AccesibilityTokens.radiusInput),
          border: Border.all(color: borderColor, width: 1),
          boxShadow: isFocused
              ? [
                  const BoxShadow(
                    color: AppColors.orange10,
                    blurRadius: 14,
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ]
              : [],
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          onSubmitted: (_) => onSubmitted?.call(),
          style: theme.textTheme.bodyLarge,
          decoration: InputDecoration(
            isDense: true,
            filled: false,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            labelText: label,
            hintText: hint,
            labelStyle: isFocused
                ? GlobalTextStyles.mediumBody(
                    context,
                  ).copyWith(color: AppColors.orange50)
                : GlobalTextStyles.mediumBody(
                    context,
                  ).copyWith(color: AppColors.gray70),
            hintStyle: GlobalTextStyles.mediumBody(
              context,
            ).copyWith(color: AppColors.gray50),
            prefixIcon: prefixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 10,
                      end: 6,
                    ),
                    child: prefixIcon,
                  ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
            ),
            suffixIcon: suffixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 6,
                      end: 10,
                    ),
                    child: suffixIcon,
                  ),
            border: InputBorder.none,
            errorText: errorText,
          ),
        ),
      ),
    );
  }
}
