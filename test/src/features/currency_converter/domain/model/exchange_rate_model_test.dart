import 'dart:convert';

import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/rate_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const rateModel = RateModel(
    id: 'USD',
    amount: 19.0774,
  );

  final exchangeRateModel = ExchangeRateModel(
    amount: 100.0,
    base: 'BRL',
    date: DateTime(2021, 09, 15),
    rates: const [
      rateModel,
    ],
  );

  group('Tests on ExchangeRateModel', () {
    test(
      'exchangeRateModel is a instance of ExchangeRateModel',
      () => expect(exchangeRateModel, isA<ExchangeRateModel>()),
    );

    test(
      'Test Equatable props values',
      () => expect(exchangeRateModel.props, [
        100.0,
        'BRL',
        DateTime(2021, 09, 15),
      ]),
    );

    test('Test fromJson with one rate', () {
      final ExchangeRateModel model = ExchangeRateModel.fromJson(
        json: jsonDecode(fixture(name: 'exchange_rate.json')),
      );

      expect(model, isNotNull);
      expect(model, isA<ExchangeRateModel>());
      expect(model, exchangeRateModel);
    });

    test('Test fromJson with multiples rates', () {
      final ExchangeRateModel model = ExchangeRateModel.fromJson(
        json: jsonDecode(fixture(name: 'exchange_rates.json')),
      );

      expect(model, isNotNull);
      expect(model, isA<ExchangeRateModel>());
      expect(model.amount, 100);
      expect(model.amount, isA<num>());
      expect(model.base, 'BRL');
      expect(model.date, DateTime(2021, 09, 15));
      expect(model.rates, isNotEmpty);
      expect(model.rates.length, 32);
      expect(model.rates.contains(rateModel), true);
    });
  });
}
