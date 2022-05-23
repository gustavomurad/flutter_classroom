import 'package:flutter/material.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/components/rounded_text_button.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_app_mock.dart';

main() {
  group('Tests on nRoundedTextButton', () {
    testWidgets('Test if RoundedTextButton has a label', (tester) async {
      Widget build() => buildMock(
            subject: RoundedTextButton(
              label: 'OK',
              onPressed: () {},
            ),
          );

      await tester.pumpWidget(build());

      final finder = find.text('OK');

      expect(finder, findsOneWidget);
    });

    testWidgets('Test RoundedTextButton tap', (tester) async {
      int counter = 0;

      Widget build() => buildMock(
            subject: RoundedTextButton(
              label: 'OK',
              onPressed: () => counter++,
            ),
          );

      await tester.pumpWidget(build());

      final finder = find.text('OK');
      expect(finder, findsOneWidget);

      expect(counter, 0);

      await tester.tap(finder);
      await tester.pumpAndSettle();

      expect(counter, 1);
    });
  });
}
