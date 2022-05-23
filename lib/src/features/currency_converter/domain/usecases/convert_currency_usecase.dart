import 'package:flutter_classroom/src/features/currency_converter/data/repository/currency_repository.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart';

class ConvertCurrencyUsecase {
  final CurrencyRepository _repository;

  const ConvertCurrencyUsecase({
    required CurrencyRepository repository,
  }) : _repository = repository;

  Future<ExchangeRateModel> call({
    required ConversionModel conversionModel,
  }) =>
      _repository.convertCurrency(conversionModel: conversionModel);
}
