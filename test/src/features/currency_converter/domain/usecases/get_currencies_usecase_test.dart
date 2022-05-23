import 'package:flutter_classroom/src/features/currency_converter/data/repository/currency_repository.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/currency_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/usecases/get_currencies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_currencies_usecase_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<CurrencyRepository>(as: #CurrencyRepositoryMock),
])
main() {
  final repository = CurrencyRepositoryMock();
  final usecase = GetCurrenciesUsecase(repository: repository);
  const List<CurrencyModel> currencies = [
    CurrencyModel(id: 'AUD', description: 'Australian Dollar'),
    CurrencyModel(id: 'BRL', description: 'Brazilian Real'),
    CurrencyModel(id: 'CHF', description: 'Swiss Franc'),
    CurrencyModel(id: 'EUR', description: 'Euro'),
  ];

  group('Tests on GetCurrenciesUsecase', () {
    test('Test getCurrencies from fixture', () async {
      when(repository.getCurrencies()).thenAnswer((_) async => currencies);

      final actual = await usecase();

      expect(actual, isA<List<CurrencyModel>>());
      expect(actual.isNotEmpty, true);
      expect(actual.length, 4);
    });

    test('Test getCurrencies from empty map', () async {
      when(repository.getCurrencies()).thenAnswer((_) async => const []);

      final actual = await usecase();

      expect(actual, isA<List<CurrencyModel>>());
      expect(actual.isEmpty, true);
    });
  });
}
