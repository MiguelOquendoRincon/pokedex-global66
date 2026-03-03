import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/core/widgets/pokeball_loader.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/providers/pokemon_list_provider.dart';

/// Full-screen Pokéball splash shown once on cold start.
///
/// Navigation gate: both conditions must be true before leaving splash:
///   1. [_animationDone] — animation sequence has completed
///   2. [_dataReady]     — pokemonListProvider has at least one page loaded
///
/// Safety net: if neither completes within [_maxWait], we navigate anyway.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({required this.onComplete, super.key});

  /// Called when both the animation and the data are ready.
  final VoidCallback onComplete;

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  // ── Durations ──────────────────────────────────────────────────────────────

  static const _spinDuration = Duration(milliseconds: 1400);
  static const _titleFadeIn = Duration(milliseconds: 500);
  static const _holdDuration = Duration(milliseconds: 600);
  static const _fadeOutDuration = Duration(milliseconds: 400);

  /// Hard ceiling: if data never arrives, leave splash after this.
  static const _maxWait = Duration(seconds: 6);

  // ── State ──────────────────────────────────────────────────────────────────

  bool _animationDone = false;
  bool _dataReady = false;
  bool _completed = false;

  // ── Animation controllers ──────────────────────────────────────────────────

  late final AnimationController _titleController;
  late final AnimationController _fadeOutController;

  late final Animation<double> _titleOpacity;
  late final Animation<double> _screenOpacity;

  @override
  void initState() {
    super.initState();

    _titleController = AnimationController(vsync: this, duration: _titleFadeIn);
    _titleOpacity = CurvedAnimation(
      parent: _titleController,
      curve: Curves.easeIn,
    );

    _fadeOutController = AnimationController(
      vsync: this,
      duration: _fadeOutDuration,
    );
    _screenOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _fadeOutController, curve: Curves.easeIn),
    );

    _runAnimationSequence();

    // Safety net — navigate regardless after _maxWait.
    Future.delayed(_maxWait, () {
      if (mounted) _maybeComplete();
    });
  }

  // ── Animation sequence ─────────────────────────────────────────────────────

  Future<void> _runAnimationSequence() async {
    await Future.delayed(_spinDuration);
    if (!mounted) return;

    await _titleController.forward();
    if (!mounted) return;

    await Future.delayed(_holdDuration);
    if (!mounted) return;

    _animationDone = true;
    _maybeComplete();
  }

  // ── Gate ───────────────────────────────────────────────────────────────────

  void _maybeComplete() {
    if (_completed) return;
    if (!_animationDone || !_dataReady) return;

    _completed = true;
    _fadeOutController.forward().then((_) {
      if (mounted) widget.onComplete();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _fadeOutController.dispose();
    super.dispose();
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    // Watch the list provider and flip _dataReady as soon as data arrives.
    final listState = ref.watch(pokemonListProvider);
    if (!_dataReady &&
        !listState.isInitialLoading &&
        (listState.previews.isNotEmpty || listState.error != null)) {
      // Schedule after build — can't call setState mid-build.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        setState(() => _dataReady = true);
        _maybeComplete();
      });
    }

    return FadeTransition(
      opacity: _screenOpacity,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PokeballLoader(size: 96),
              const SizedBox(height: 28),
              FadeTransition(
                opacity: _titleOpacity,
                child: Column(
                  children: [
                    Text(
                      'Pokédex',
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Global66',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
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
