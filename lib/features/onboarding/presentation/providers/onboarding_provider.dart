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

  Future<void> complete() async {
    final prefs = ref.read(sharedPrefsProvider);
    await prefs.setBool(_kOnboardingKey, true);
    state = true;
  }
}

// Internal provider — SharedPreferences injected via bootstrap override.
@Riverpod(keepAlive: true)
SharedPreferences sharedPrefs(Ref ref) =>
    throw UnimplementedError('Must be overridden in bootstrap.dart');
