import 'package:flutter/material.dart';

import 'package:pokedex_global66/core/design_system/spacings.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/core/utils/text_styles/global_text_styles.dart';

class BaseTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? errorText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final bool enabled;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  const BaseTextField({
    super.key,
    required this.label,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: errorText != null
            ? AppColors.red70
            : AppColors.red70.withValues(alpha: 0.2),
        width: 1.0,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GlobalTextStyles.boldSmallBody(context)),
        const SizedBox(height: AppSpacings.xs),
        TextField(
          enabled: enabled,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: GlobalTextStyles.smallBody(context),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintText: hintText,
            hintStyle: GlobalTextStyles.smallBody(
              context,
            ).copyWith(color: AppColors.gray70),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: AppColors.orange70)
                : null,
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: AppColors.gray50)
                : null,
            enabledBorder: border,
            focusedBorder: border.copyWith(
              borderSide: BorderSide(
                color: AppColors.red70.withValues(alpha: 0.4),
                width: 1.2,
              ),
            ),
            errorBorder: border,
            focusedErrorBorder: border,
            disabledBorder: border.copyWith(
              borderSide: const BorderSide(color: AppColors.gray50),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppSpacings.sm,
              horizontal: AppSpacings.md,
            ),
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}
