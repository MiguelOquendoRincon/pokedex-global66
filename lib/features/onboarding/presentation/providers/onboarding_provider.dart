// ══════════════════════════════════════════════════════════════════════════════
// features/onboarding/presentation/providers/onboarding_provider.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_provider.g.dart';

const _kOnboardingKey = 'onboarding_done';

/// Persisted bool: has the user completed the onboarding?
/// keepAlive: true → survives navigation, router redirect reads it reactively.
@Riverpod(keepAlive: true)
class OnboardingDone extends _$OnboardingDone {
  @override
  bool build() {
    // Read synchronously — SharedPreferences is already initialised in bootstrap.
    final prefs = ref.read(sharedPrefsProvider);
    return prefs.getBool(_kOnboardingKey) ?? false;
  }

  /// Marks the onboarding as completed and persists the status.
  Future<void> complete() async {
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setBool(_kOnboardingKey, true);
    state = true;
  }
}

/// Internal provider for [SharedPreferences].
///
/// It must be overridden in the [ProviderScope] (e.g., in `bootstrap.dart`).
@Riverpod(keepAlive: true)
SharedPreferences sharedPrefs(Ref ref) =>
    throw UnimplementedError('Must be overridden in bootstrap.dart');
