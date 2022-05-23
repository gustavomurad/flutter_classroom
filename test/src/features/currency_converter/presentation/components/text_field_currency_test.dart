import 'package:flutter/cupertino.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/components/text_field_currency.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_app_mock.dart';

main() {
  group('Tests on TextFieldCurrency', () {
    testWidgets('Test if TextFieldCurrency has label, hint and suffix',
        (tester) async {
      final Key textFieldKey = UniqueKey();

      Widget build() => buildMock(
            subject: TextFieldCurrency(
              key: textFieldKey,
              labelText: 'Text Field Currency',
              hintText: 'Test on TextFieldCurrency',
              suffixText: 'Test (TST)',
            ),
          );

      await tester.pumpWidget(build());

      final textFieldCurrency = find.byType(TextFieldCurrency);
      expect(textFieldCurrency, findsOneWidget);
      expect(find.text('Text Field Currency'), findsOneWidget);
      expect(find.text('Test on TextFieldCurrency'), findsOneWidget);
      expect(find.text('Test (TST)'), findsOneWidget);
    });

    testWidgets('Test TextFieldCurrency behaviour', (tester) async {
      final Key textFieldKey = UniqueKey();
      final controller = TextEditingController();

      Widget build() => buildMock(
            subject: TextFieldCurrency(
              key: textFieldKey,
              labelText: 'Text Field Currency',
              hintText: 'Test on TextFieldCurrency',
              suffixText: 'Test (TST)',
              controller: controller,
            ),
          );

      await tester.pumpWidget(build());

      final textFieldCurrency = find.byType(TextFieldCurrency);
      expect(textFieldCurrency, findsOneWidget);

      await tester.enterText(textFieldCurrency, '1000.33');
      expect(find.text('1000.33'), findsOneWidget);
      expect(controller.value.text, '1000.33');
    });
  });
}
