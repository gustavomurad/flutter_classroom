import 'dart:convert';

import 'package:flutter_classroom/src/core/exceptions/exceptions.dart';
import 'package:flutter_classroom/src/features/currency_converter/data/repository/currency_repository.dart';
import 'package:flutter_classroom/src/features/currency_converter/data/repository/currency_repository_impl.dart';
import 'package:flutter_classroom/src/features/currency_converter/data/services/currency_service.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/currency_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/rate_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'currency_repository_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<CurrencyService>(as: #CurrencyServiceMock),
])
main() {
  const conversionModel = ConversionModel(
    amount: 200,
    from: 'USD',
    to: 'BRL',
  );

  const rateModel = RateModel(id: 'BRL', amount: 1110.61);

  final CurrencyService service = CurrencyServiceMock();
  final CurrencyRepository repository = CurrencyRepositoryImpl(
    service: service,
  );

  late Map<String, dynamic> currenciesMap;
  late Map<String, dynamic> conversionMap;

  setUpAll(() {
    currenciesMap = jsonDecode(fixture(name: 'currencies.json'));
    conversionMap = jsonDecode(fixture(name: 'conversion.json'));
  });

  group('Tests on CurrencyRepository', () {
    test('Test getCurrencies from fixture', () async {
      when(service.getCurrencies()).thenAnswer((_) async => currenciesMap);

      final actual = await repository.getCurrencies();

      expect(actual, isA<List<CurrencyModel>>());
      expect(actual.length, 33);
    });

    test('Test getCurrencies with empty json ', () async {
      when(service.getCurrencies()).thenAnswer((_) async => {});

      final actual = await repository.getCurrencies();

      expect(actual, isA<List<CurrencyModel>>());
      expect(actual.isEmpty, true);
    });

    test('Test convertCurrency from fixture', () async {
      when(service.convertCurrency(conversionModel: conversionModel))
          .thenAnswer((_) async => conversionMap);

      final actual = await repository.convertCurrency(
        conversionModel: conversionModel,
      );

      expect(actual, isA<ExchangeRateModel>());
      expect(actual.amount, 200);
      expect(actual.base, 'USD');
      expect(actual.date, DateTime(2021, 10, 27));
      expect(actual.rates.isNotEmpty, true);
      expect(actual.rates.contains(rateModel), true);
      expect(actual.rates.first, equals(rateModel));
    });

    test('Test convertCurrency with empty json ', () async {
      when(service.convertCurrency(conversionModel: conversionModel))
          .thenThrow(const JsonParseException(
        message: 'ExchangeRateModel.fromJson receive a empty map',
      ));

      expect(
        () async => repository.convertCurrency(
          conversionModel: conversionModel,
        ),
        throwsA(
          isA<JsonParseException>().having(
            (error) => error.toString(),
            'message',
            'ExchangeRateModel.fromJson receive a empty map',
          ),
        ),
      );
    });
  });
}
