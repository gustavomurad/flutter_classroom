import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/currency_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart';

abstract class CurrencyRepository {
  Future<List<CurrencyModel>> getCurrencies();

  Future<ExchangeRateModel> convertCurrency({
    required ConversionModel conversionModel,
  });
}
