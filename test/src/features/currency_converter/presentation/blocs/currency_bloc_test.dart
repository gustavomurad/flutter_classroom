import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_classroom/src/core/services/http_exception.dart';
import 'package:flutter_classroom/src/features/currency_converter/data/repository/currency_repository.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/currency_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/rate_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/business_logic_objects/currency_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'currency_bloc_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<CurrencyRepository>(as: #CurrencyRepositoryMock),
])
main() {
  final repository = CurrencyRepositoryMock();
  const conversionModel = ConversionModel(
    amount: 200,
    from: 'USD',
    to: 'BRL',
  );
  const rateModel = RateModel(id: 'BRL', amount: 1110.61);
  const List<CurrencyModel> currencies = [
    CurrencyModel(id: 'AUD', description: 'Australian Dollar'),
    CurrencyModel(id: 'BRL', description: 'Brazilian Real'),
    CurrencyModel(id: 'CHF', description: 'Swiss Franc'),
    CurrencyModel(id: 'EUR', description: 'Euro'),
  ];

  final exchangeRateModel = ExchangeRateModel(
    amount: 200,
    base: 'USD',
    date: DateTime(2021, 10, 27),
    rates: const [
      RateModel(id: 'BRL', amount: 1110.61),
    ],
  );

  group('Tests on CurrencyBloc', () {
    blocTest<CurrencyBloc, CurrencyState>(
        'Test Bloc when GetCurrenciesEvent is added',
        build: () {
          when(repository.getCurrencies()).thenAnswer((_) async => currencies);

          return CurrencyBloc(repository: repository);
        },
        act: (bloc) => bloc.add(const GetCurrenciesEvent()),
        expect: () => [
              isA<CurrencyLoadingState>(),
              isA<GetCurrenciesSuccessState>(),
            ],
        verify: (bloc) {
          final value = (bloc.state as GetCurrenciesSuccessState).currencies;
          expect(value.isNotEmpty, true);
          expect(value.length, 4);
        });

    blocTest<CurrencyBloc, CurrencyState>(
      'Test Bloc when GetCurrenciesEvent receive an Exception',
      build: () {
        when(repository.getCurrencies()).thenThrow(
          const BusinessException(code: 1, message: 'test exception'),
        );

        return CurrencyBloc(repository: repository);
      },
      act: (bloc) => bloc.add(const GetCurrenciesEvent()),
      expect: () => [
        isA<CurrencyLoadingState>(),
        isA<CurrencyErrorState>(),
      ],
      verify: (bloc) {
        final message = (bloc.state as CurrencyErrorState).message;
        expect(message, 'Erro ao obter os dados do Banco Central Europeu');
      },
    );

    blocTest<CurrencyBloc, CurrencyState>(
        'Test Bloc when ConvertCurrencyEvent is added',
        build: () {
          when(repository.convertCurrency(
            conversionModel: conversionModel,
          )).thenAnswer((_) async => exchangeRateModel);

          return CurrencyBloc(repository: repository);
        },
        act: (bloc) => bloc.add(
              const ConvertCurrencyEvent(
                conversionModel: conversionModel,
              ),
            ),
        expect: () => [
              isA<CurrencyLoadingState>(),
              isA<ConvertCurrencySuccessState>(),
            ],
        verify: (bloc) {
          final value = (bloc.state as ConvertCurrencySuccessState).conversion;
          expect(value, isA<ExchangeRateModel>());
          expect(value.amount, 200);
          expect(value.base, 'USD');
          expect(value.date, DateTime(2021, 10, 27));
          expect(value.rates.isNotEmpty, true);
          expect(value.rates.contains(rateModel), true);
          expect(value.rates.first, equals(rateModel));
        });

    blocTest<CurrencyBloc, CurrencyState>(
      'Test Bloc when ConvertCurrencyEvent receive an Exception',
      build: () {
        when(repository.convertCurrency(
          conversionModel: conversionModel,
        )).thenThrow(
          const BusinessException(code: 1, message: 'test exception'),
        );

        return CurrencyBloc(repository: repository);
      },
      act: (bloc) => bloc.add(
        const ConvertCurrencyEvent(
          conversionModel: conversionModel,
        ),
      ),
      expect: () => [
        isA<CurrencyLoadingState>(),
        isA<CurrencyErrorState>(),
      ],
      verify: (bloc) {
        final message = (bloc.state as CurrencyErrorState).message;
        expect(message, 'Erro ao obter os dados do Banco Central Europeu');
      },
    );
  });
}
