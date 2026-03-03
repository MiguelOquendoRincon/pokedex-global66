// ══════════════════════════════════════════════════════════════════════════════
// test/features/onboarding/presentation/providers/onboarding_provider_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pokedex_global66/features/onboarding/presentation/providers/onboarding_provider.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockPrefs;
  late ProviderContainer container;

  const kOnboardingKey = 'onboarding_done';

  setUp(() {
    mockPrefs = MockSharedPreferences();

    // Default stubs
    when(() => mockPrefs.getBool(kOnboardingKey)).thenReturn(null);
    when(
      () => mockPrefs.setBool(kOnboardingKey, any()),
    ).thenAnswer((_) async => true);

    container = ProviderContainer(
      overrides: [sharedPrefsProvider.overrideWithValue(mockPrefs)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('OnboardingDone Notifier', () {
    test('initial state should be false if not found in SharedPreferences', () {
      // Act
      final state = container.read(onboardingDoneProvider);

      // Assert
      expect(state, false);
      verify(() => mockPrefs.getBool(kOnboardingKey)).called(1);
    });

    test(
      'initial state should be true if onboarding_done is true in SharedPreferences',
      () {
        // Arrange (override initial setup)
        when(() => mockPrefs.getBool(kOnboardingKey)).thenReturn(true);

        // Re-create container to trigger build with new stub
        final container2 = ProviderContainer(
          overrides: [sharedPrefsProvider.overrideWithValue(mockPrefs)],
        );

        // Act
        final state = container2.read(onboardingDoneProvider);

        // Assert
        expect(state, true);
        verify(() => mockPrefs.getBool(kOnboardingKey)).called(1);
        container2.dispose();
      },
    );

    test(
      'complete() method should update state and persist to SharedPreferences',
      () async {
        // Arrange
        expect(container.read(onboardingDoneProvider), false);

        // Act
        await container.read(onboardingDoneProvider.notifier).complete();

        // Assert
        expect(container.read(onboardingDoneProvider), true);
        verify(() => mockPrefs.setBool(kOnboardingKey, true)).called(1);
      },
    );
  });
}
