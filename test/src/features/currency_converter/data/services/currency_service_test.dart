import 'dart:convert';

import 'package:flutter_classroom/src/core/services/http_client.dart';
import 'package:flutter_classroom/src/features/currency_converter/data/services/currency_service.dart';
import 'package:flutter_classroom/src/features/currency_converter/data/services/currency_service_impl.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'currency_service_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<HttpClient>(as: #HttpClientMock)])
main() {
  final HttpClient client = HttpClientMock();
  final CurrencyService service = CurrencyServiceImpl(client: client);
  late Map<String, dynamic> currencyMap;
  late Map<String, dynamic> conversionMap;

  setUp(() {
    currencyMap = jsonDecode(fixture(name: 'currencies.json'));
    conversionMap = jsonDecode(fixture(name: 'conversion.json'));
  });

  group('Tests on CurrencyService', () {
    test('Test getCurrencies from fixture', () async {
      when(client.httpsGet(path: '/currencies'))
          .thenAnswer((_) async => currencyMap);

      final actual = await service.getCurrencies();
      expect(actual, isA<Map<String, dynamic>>());
      expect(actual.isNotEmpty, true);
      expect(actual.length, 33);
    });

    test('Test getCurrencies from empty json', () async {
      when(client.httpsGet(path: '/currencies')).thenAnswer((_) async => {});

      final actual = await service.getCurrencies();

      expect(actual, isA<Map<String, dynamic>>());
      expect(actual.isEmpty, true);
    });

    test('Test convertCurrency from fixture', () async {
      const conversionModel = ConversionModel(
        amount: 200,
        from: 'USD',
        to: 'BRL',
      );

      final json = conversionModel.toJson();

      when(client.httpsGet(path: '/latest', queryParameters: json))
          .thenAnswer((_) async => conversionMap);

      final actual = await service.convertCurrency(
        conversionModel: conversionModel,
      );

      expect(actual, isA<Map<String, dynamic>>());
      expect(actual.isNotEmpty, true);
      expect(actual['amount'], 200);
      expect(actual['base'], 'USD');
      expect(actual['date'], '2021-10-27');
      expect(actual['rates']['BRL'], 1110.61);
    });

    test('Test convertCurrency from empty json', () async {
      const conversionModel = ConversionModel(
        amount: 200,
        from: 'USD',
        to: 'BRL',
      );

      final json = conversionModel.toJson();

      when(client.httpsGet(path: '/latest', queryParameters: json))
          .thenAnswer((_) async => {});

      final actual = await service.convertCurrency(
        conversionModel: conversionModel,
      );

      expect(actual, isA<Map<String, dynamic>>());
      expect(actual.isEmpty, true);
    });
  });
}
