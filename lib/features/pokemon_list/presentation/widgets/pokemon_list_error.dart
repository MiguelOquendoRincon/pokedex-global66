// ══════════════════════════════════════════════════════════════════════════════
// widgets/pokemon_list_error.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';

import 'package:pokedex_global66/core/error/app_exception.dart';
import 'package:pokedex_global66/core/l10n/l10n_extension.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

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
            const Icon(
              Icons.wifi_off_rounded,
              size: 64,
              color: AppColors.textMedium,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textMedium, fontSize: 16),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(l10n.retryButton),
              style: FilledButton.styleFrom(backgroundColor: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
