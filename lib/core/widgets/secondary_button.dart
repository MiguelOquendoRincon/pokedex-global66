import 'package:flutter/material.dart';

import 'package:pokedex_global66/core/design_system/spacings.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/core/utils/screen_size/responsive_extension.dart';
import 'package:pokedex_global66/core/utils/text_styles/global_text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool outlined;
  final bool isLoading;
  final bool fullWidth;
  final BorderRadiusGeometry borderRadius;

  const SecondaryButton._internal({
    required this.title,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.outlined = false,
    this.isLoading = false,
    this.fullWidth = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
  });

  factory SecondaryButton({
    required String title,
    VoidCallback? onPressed,
    bool isLoading = false,
    bool fullWidth = false,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(10.0),
    ),
  }) {
    return SecondaryButton._internal(
      title: title,
      onPressed: onPressed,
      isLoading: isLoading,
      fullWidth: fullWidth,
      borderRadius: borderRadius,
    );
  }

  factory SecondaryButton.outlined({
    required String title,
    VoidCallback? onPressed,
    bool isLoading = false,
    bool fullWidth = false,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(10.0),
    ),
  }) {
    return SecondaryButton._internal(
      title: title,
      onPressed: onPressed,
      outlined: true,
      isLoading: isLoading,
      fullWidth: fullWidth,
      borderRadius: borderRadius,
    );
  }

  factory SecondaryButton.prefixIcon({
    required String title,
    required IconData icon,
    VoidCallback? onPressed,
    bool isLoading = false,
    bool fullWidth = false,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(10.0),
    ),
  }) {
    return SecondaryButton._internal(
      title: title,
      prefixIcon: icon,
      onPressed: onPressed,
      isLoading: isLoading,
      fullWidth: fullWidth,
      borderRadius: borderRadius,
    );
  }

  factory SecondaryButton.suffixIcon({
    required String title,
    required IconData icon,
    VoidCallback? onPressed,
    bool isLoading = false,
    bool fullWidth = false,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(10.0),
    ),
  }) {
    return SecondaryButton._internal(
      title: title,
      suffixIcon: icon,
      onPressed: onPressed,
      isLoading: isLoading,
      fullWidth: fullWidth,
      borderRadius: borderRadius,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor = outlined
        ? Colors.transparent
        : AppColors.orange70.withValues(alpha: 0.1);
    final Color contentColor = outlined ? Colors.white : AppColors.orange70;
    final BorderSide border = outlined
        ? const BorderSide(color: AppColors.orange70, width: 1.5)
        : BorderSide.none;

    final button = IconButton(
      onPressed: isLoading ? null : onPressed,
      highlightColor: AppColors.orange70.withValues(alpha: 0.3),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(bgColor),
        elevation: WidgetStateProperty.all<double>(2.0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: borderRadius, side: border),
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            horizontal: AppSpacings.lg,
            vertical: AppSpacings.sm,
          ),
        ),
      ),
      icon: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: contentColor,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefixIcon != null) ...[
                  Icon(
                    prefixIcon,
                    size: context.responsive.scaledIconSize(22.0),
                    color: contentColor,
                  ),
                  const SizedBox(width: AppSpacings.sm),
                ],
                Text(
                  title,
                  style: GlobalTextStyles.boldSmallBody(
                    context,
                  ).copyWith(color: contentColor),
                ),
                if (suffixIcon != null) ...[
                  const SizedBox(width: AppSpacings.sm),
                  Icon(suffixIcon, size: 20, color: contentColor),
                ],
              ],
            ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
