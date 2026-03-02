import 'package:flutter/material.dart';

import 'package:pokedex_global66/core/theme/tokens/accesibility.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/core/utils/text_styles/global_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final bool enabled;
  final Color bgColor;
  final Color textColor;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.loading = false,
    this.enabled = true,
    this.bgColor = AppColors.orange70,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg = bgColor != AppColors.orange70
        ? bgColor
        : enabled
        ? AppColors.orange70
        : scheme.surfaceContainerHighest;

    // Microinteracción al presionar
    return _PressScale(
      child: Semantics(
        button: true,
        enabled: enabled && !loading,
        label: label,
        child: SizedBox(
          height: AccesibilityTokens.minTap,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: bg,
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.white70,
              elevation: enabled ? 2 : 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: (enabled && !loading) ? onPressed : null,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: loading
                  ? const SizedBox(
                      key: ValueKey('loading'),
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      key: const ValueKey('label'),
                      label,
                      style: GlobalTextStyles.h6SmallSubtitle(
                        context,
                      ).copyWith(fontWeight: FontWeight.w700, color: textColor),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Scale sutil en press/hover (desktop)
class _PressScale extends StatefulWidget {
  final Widget child;
  const _PressScale({required this.child});

  @override
  State<_PressScale> createState() => _PressScaleState();
}

class _PressScaleState extends State<_PressScale> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() => _pressed = true),
      onPointerUp: (_) => setState(() => _pressed = false),
      onPointerCancel: (_) => setState(() => _pressed = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: _pressed ? 0.98 : 1.0,
        child: widget.child,
      ),
    );
  }
}
