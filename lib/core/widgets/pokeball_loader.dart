import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/tokens/icons_svg.dart';

/// A spinning Pokéball image used as a loading indicator across the app.
///
/// Drop-in replacement for [CircularProgressIndicator].
/// Usage:
/// ```dart
/// const PokeballLoader()               // default 64 px
/// const PokeballLoader(size: 40)       // smaller, e.g. inside a button
/// PokeballLoader(size: 80, label: 'Loading…')
/// ```
class PokeballLoader extends StatefulWidget {
  const PokeballLoader({this.size = 64, this.label, super.key});

  /// Diameter of the Pokéball image in logical pixels.
  final double size;

  /// Optional text label rendered below the ball.
  final String? label;

  @override
  State<PokeballLoader> createState() => _PokeballLoaderState();
}

class _PokeballLoaderState extends State<PokeballLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spinner = RotationTransition(
      turns: _controller,
      child: Image.asset(
        CustomIcons.pokeball,
        width: widget.size,
        height: widget.size,
        // Graceful fallback if asset is missing
        errorBuilder: (_, _, _) => SizedBox(
          width: widget.size,
          height: widget.size,
          child: CircularProgressIndicator(strokeWidth: widget.size / 20),
        ),
      ),
    );

    if (widget.label == null) return spinner;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        spinner,
        const SizedBox(height: 12),
        Text(
          widget.label!,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}

/// Full-screen centred Pokéball loader — handy for page-level loading states.
class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({this.label, super.key});
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: PokeballLoader(size: 72, label: label)),
    );
  }
}

/// Compact inline Pokéball loader sized to replace a small spinner inside
/// buttons or cards (defaults to 20 px).
class InlineLoader extends StatelessWidget {
  const InlineLoader({this.size = 20, this.color, super.key});
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return PokeballLoader(size: size);
  }
}
