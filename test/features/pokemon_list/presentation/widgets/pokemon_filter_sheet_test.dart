import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_filter_sheet.dart';
import '../../../../helpers/test_utils.dart';

void main() {
  testWidgets('shows filter sheet and can select types', (tester) async {
    Set<String>? selectedTypes;

    await tester.pumpWidget(
      wrapWithMaterial(
        Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () async {
                selectedTypes = await showPokemonFilterSheet(
                  context,
                  initialTypes: {'grass'},
                );
              },
              child: const Text('Open Sheet'),
            );
          },
        ),
      ),
    );

    // Open the sheet
    await tester.tap(find.text('Open Sheet'));
    await tester.pumpAndSettle();

    // Verify initial selection (visual check by custom checkbox logic is hard, but we can tap)
    expect(find.text('Filter by your preferences'), findsOneWidget);
    expect(find.text('Electric'), findsOneWidget);

    // Toggle different type
    await tester.tap(find.text('Electric'));
    await tester.pumpAndSettle();

    // Apply filters
    await tester.tap(find.text('Apply'));
    await tester.pumpAndSettle();

    // 'grass' was initial, 'electric' was added
    expect(selectedTypes, containsAll(['grass', 'electric']));
  });

  testWidgets('sheet can be closed via close icon without applying', (
    tester,
  ) async {
    Set<String>? selectedTypes = {'none'};

    await tester.pumpWidget(
      wrapWithMaterial(
        Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () async {
                selectedTypes = await showPokemonFilterSheet(context);
              },
              child: const Text('Open Sheet'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Open Sheet'));
    await tester.pumpAndSettle();

    final closeButton = find.byIcon(Icons.close);
    expect(closeButton, findsOneWidget);

    await tester.tap(closeButton);
    await tester.pumpAndSettle();

    // selectedTypes should be null or unchanged depending on pop logic
    // Pop returns null when closing via icon (Navigator.pop(context))
    expect(selectedTypes, isNull);
  });
}
