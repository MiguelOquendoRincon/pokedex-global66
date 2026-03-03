// ══════════════════════════════════════════════════════════════════════════════
// test/features/pokemon_list/presentation/widgets/pokemon_search_bar_test.dart
// ══════════════════════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_search_bar.dart';
import '../../../../helpers/test_utils.dart';

void main() {
  testWidgets('renders hint text and responds to user input', (tester) async {
    String changedValue = '';

    await tester.pumpWidget(
      wrapWithMaterial(
        Scaffold(
          body: PokemonSearchBar(
            hint: 'Search...',
            onChanged: (v) => changedValue = v,
          ),
        ),
      ),
    );

    expect(find.text('Search...'), findsOneWidget);

    // Enter text
    await tester.enterText(find.byType(TextField), 'pikachu');
    await tester.pump();

    expect(changedValue, 'pikachu');
    expect(find.text('pikachu'), findsOneWidget);

    // Verify clear button appears
    expect(find.byIcon(Icons.close), findsOneWidget);
  });

  testWidgets('clears text when close button is tapped', (tester) async {
    String changedValue = 'initial';

    await tester.pumpWidget(
      wrapWithMaterial(
        Scaffold(
          body: PokemonSearchBar(
            hint: 'Search...',
            onChanged: (v) => changedValue = v,
            searchQuery: 'bulba',
          ),
        ),
      ),
    );

    expect(find.text('bulba'), findsOneWidget);

    // Tap clear button
    await tester.tap(find.byIcon(Icons.close));
    await tester.pump();

    expect(find.text('bulba'), findsNothing);
    expect(changedValue, '');
  });
}
