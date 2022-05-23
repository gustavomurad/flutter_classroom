import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart';

abstract class CurrencyService {
  Future<Map<String, dynamic>> getCurrencies();

  Future<Map<String, dynamic>> convertCurrency({
    required ConversionModel conversionModel,
  });
}
