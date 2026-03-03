// ══════════════════════════════════════════════════════════════════════════════
// widgets/pokemon_list_error.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';

import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/core/theme/tokens/icons_svg.dart';

class PokemonListError extends StatelessWidget {
  const PokemonListError({
    required this.exception,
    required this.onRetry,
    super.key,
  });

  final AppException exception;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final message = switch (exception) {
      NoInternetException() => l10n.errorNoInternet,
      TimeoutException() => l10n.errorTimeout,
      ServerErrorException() => l10n.errorServer,
      NotFoundException() => l10n.errorNotFound,
      _ => l10n.errorGeneric,
    };

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(CustomIcons.pokemonNotFound, width: 185, height: 185),
            const SizedBox(height: 16),
            Text(
              '$message...',
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              l10n.pokemonListError,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),

            // ─── Retry button (full width) ──────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onRetry,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: Text(l10n.retryButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
