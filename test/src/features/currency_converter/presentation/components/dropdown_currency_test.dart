import 'package:flutter/material.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/currency_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/components/dropdown_currency.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_app_mock.dart';

main() {
  const List<DropdownMenuItem<CurrencyModel>> currencies = [
    DropdownMenuItem<CurrencyModel>(
      value: CurrencyModel(id: 'AUD', description: 'Australian Dollar'),
      child: Text('Australian Dollar (AUD)'),
    ),
    DropdownMenuItem<CurrencyModel>(
      value: CurrencyModel(id: 'BRL', description: 'Brazilian Real'),
      child: Text('Brazilian Real (BRL)'),
    ),
    DropdownMenuItem<CurrencyModel>(
      value: CurrencyModel(id: 'CHF', description: 'Swiss Franc'),
      child: Text('Swiss Franc (CHF)'),
    ),
    DropdownMenuItem<CurrencyModel>(
      value: CurrencyModel(id: 'EUR', description: 'Euro'),
      child: Text('Euro (EUR)'),
    ),
  ];
  group('Tests on DropdownCurrency', () {
    testWidgets('Test DropdownCurrency component structure', (tester) async {
      final dropdownKey = UniqueKey();

      Widget build() => buildMock(
            subject: DropdownCurrency(
              key: dropdownKey,
              labelText: 'Test mock',
              hint: const Text('Select one item!'),
              items: currencies,
            ),
          );

      await tester.pumpWidget(build());

      expect(find.text('Test mock'), findsOneWidget);
      expect(find.text('Select one item!'), findsOneWidget);
    });

    testWidgets('Test DropdownCurrency onChanged event', (tester) async {
      const matcher = CurrencyModel(id: 'CHF', description: 'Swiss Franc');
      final dropdownKey = UniqueKey();
      CurrencyModel? currencyModel;
      Widget build() => buildMock(
            subject: DropdownCurrency(
              key: dropdownKey,
              labelText: 'Test mock',
              hint: const Text('Select one item!'),
              value: currencyModel,
              items: currencies,
              onChanged: (newValue) => currencyModel = newValue,
            ),
          );

      await tester.pumpWidget(build());

      final dropdown = find.byKey(dropdownKey).last;
      expect(dropdown, findsOneWidget);

      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      final dropdownItem = find.text('Swiss Franc (CHF)').last;
      expect(dropdownItem, findsOneWidget);

      await tester.tap(dropdownItem);
      await tester.pumpAndSettle();

      expect(currencyModel, matcher);
    });
  });
}
