import 'package:flutter_classroom/src/features/currency_converter/data/repository/currency_repository.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/rate_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/usecases/convert_currency_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_currencies_usecase_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<CurrencyRepository>(as: #CurrencyRepositoryMock),
])
main() {
  final repository = CurrencyRepositoryMock();
  final usecase = ConvertCurrencyUsecase(repository: repository);
  const conversionModel = ConversionModel(
    amount: 200,
    from: 'USD',
    to: 'BRL',
  );
  const rateModel = RateModel(id: 'BRL', amount: 1110.61);

  final exchangeRateModel = ExchangeRateModel(
    amount: 200,
    base: 'USD',
    date: DateTime(2021, 10, 27),
    rates: const [
      RateModel(id: 'BRL', amount: 1110.61),
    ],
  );

  group('Tests on ConvertCurrencyUsecase', () {
    test('Test call from fixture', () async {
      when(repository.convertCurrency(conversionModel: conversionModel))
          .thenAnswer((_) async => exchangeRateModel);

      final actual = await usecase(conversionModel: conversionModel);

      expect(actual, isA<ExchangeRateModel>());
      expect(actual.amount, 200);
      expect(actual.base, 'USD');
      expect(actual.date, DateTime(2021, 10, 27));
      expect(actual.rates.isNotEmpty, true);
      expect(actual.rates.contains(rateModel), true);
      expect(actual.rates.first, equals(rateModel));
    });
  });
}
