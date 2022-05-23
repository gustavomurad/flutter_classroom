import 'package:flutter_classroom/src/features/currency_converter/data/repository/currency_repository.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/currency_model.dart';

class GetCurrenciesUsecase {
  final CurrencyRepository _repository;

  GetCurrenciesUsecase({
    required CurrencyRepository repository,
  }) : _repository = repository;

  Future<List<CurrencyModel>> call() {
    return _repository.getCurrencies();
  }
}
