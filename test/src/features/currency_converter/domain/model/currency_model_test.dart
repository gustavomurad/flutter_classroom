import 'dart:convert';

import 'package:flutter_classroom/src/features/currency_converter/domain/models/currency_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const CurrencyModel currencyModel = CurrencyModel(
    id: 'BRL',
    description: 'Brazilian Real',
  );

  group('Tests on CurrencyModel', () {
    test(
      'Should be a subclass of CurrencyModel entity',
      () => expect(currencyModel, isA<CurrencyModel>()),
    );

    test(
      'Test Equatable props values',
      () => expect(currencyModel.props, ['BRL', 'Brazilian Real']),
    );

    test('Call fromJson', () {
      final Map<String, dynamic> jsonMap = jsonDecode(fixture(
        name: 'currencies.json',
      ));

      List<CurrencyModel> currencies = [];

      jsonMap.forEach((key, value) {
        currencies.add(CurrencyModel(id: key, description: value));
      });

      expect(currencies, isA<List<CurrencyModel>>());
      expect(currencies, isNotEmpty);
      expect(currencies.length, 33);
      expect(currencies.contains(currencyModel), isTrue);
    });
  });
}
