// ══════════════════════════════════════════════════════════════════════════════
// features/onboarding/presentation/screens/onboarding_screen.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/router/app_router.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/core/theme/tokens/icons_svg.dart';
import 'package:pokedex_global66/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:pokedex_global66/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:pokedex_global66/features/onboarding/presentation/widgets/onboarding_page_widget.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;
  static const _totalPages = 2;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < _totalPages - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _finish();
    }
  }

  Future<void> _finish() async {
    await ref.read(onboardingDoneProvider.notifier).complete();
    if (mounted) context.go(AppRoutes.pokedex);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isLast = _currentPage == _totalPages - 1;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Skip button ───────────────────────────────────────────────
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _finish,
                child: Text(
                  l10n.onboardingSkip,
                  style: const TextStyle(color: AppColors.primaryDark),
                ),
              ),
            ),

            // ── Pages ─────────────────────────────────────────────────────
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => _currentPage = i),
                children: [
                  OnboardingPageWidget(
                    imagePath: CustomIcons.onboarding1,
                    title: l10n.onboarding1Title,
                    description: l10n.onboarding1Description,
                  ),
                  OnboardingPageWidget(
                    imagePath: CustomIcons.onboarding2,
                    title: l10n.onboarding2Title,
                    description: l10n.onboarding2Description,
                  ),
                ],
              ),
            ),

            // ── Indicator dots ────────────────────────────────────────────
            OnboardingIndicator(count: _totalPages, current: _currentPage),
            const SizedBox(height: 35),

            // ── CTA button ────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SizedBox(
                width: double.infinity,
                height: 58.0,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: _onNext,
                  child: Text(
                    isLast ? l10n.onboardingStart : l10n.onboardingNext,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
