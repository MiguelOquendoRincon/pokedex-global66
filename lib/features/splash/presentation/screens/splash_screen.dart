import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/core/widgets/pokeball_loader.dart';

/// Full-screen Pokéball splash shown once on cold start.
///
/// Flow:
///   1. Pokéball spins for [_spinDuration]
///   2. "Pokédex" title fades in
///   3. Whole screen fades out over [_fadeOutDuration]
///   4. [onComplete] is called → router replaces with the real initial route
class SplashScreen extends StatefulWidget {
  const SplashScreen({required this.onComplete, super.key});

  /// Called when the animation finishes. Should navigate away.
  final VoidCallback onComplete;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  static const _spinDuration = Duration(milliseconds: 1400);
  static const _titleFadeIn = Duration(milliseconds: 500);
  static const _holdDuration = Duration(milliseconds: 600);
  static const _fadeOutDuration = Duration(milliseconds: 400);

  late final AnimationController _titleController;
  late final AnimationController _fadeOutController;

  late final Animation<double> _titleOpacity;
  late final Animation<double> _screenOpacity;

  @override
  void initState() {
    super.initState();

    // Title fade-in
    _titleController = AnimationController(vsync: this, duration: _titleFadeIn);
    _titleOpacity = CurvedAnimation(
      parent: _titleController,
      curve: Curves.easeIn,
    );

    // Full-screen fade-out
    _fadeOutController = AnimationController(
      vsync: this,
      duration: _fadeOutDuration,
    );
    _screenOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _fadeOutController, curve: Curves.easeIn),
    );

    _runSequence();
  }

  Future<void> _runSequence() async {
    // Let the ball spin a bit first
    await Future.delayed(_spinDuration);
    if (!mounted) return;

    // Fade in title
    await _titleController.forward();
    if (!mounted) return;

    // Hold so the user can read it
    await Future.delayed(_holdDuration);
    if (!mounted) return;

    // Fade out everything
    await _fadeOutController.forward();
    if (!mounted) return;

    widget.onComplete();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _fadeOutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _screenOpacity,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spinning Pokéball
              const PokeballLoader(size: 96),

              const SizedBox(height: 28),

              // Animated title
              FadeTransition(
                opacity: _titleOpacity,
                child: Column(
                  children: [
                    Text(
                      'Pokédex',
                      style: GoogleFonts.outfit(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Global66',
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withValues(alpha: 0.7),
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
