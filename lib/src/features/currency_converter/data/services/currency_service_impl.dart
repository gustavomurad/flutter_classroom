import 'package:flutter_classroom/src/core/services/http_client.dart';
import 'package:flutter_classroom/src/features/currency_converter/data/services/currency_service.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart';

class CurrencyServiceImpl implements CurrencyService {
  static const _currencies = '/currencies';
  static const _latest = '/latest';
  final HttpClient _client;

  CurrencyServiceImpl({required HttpClient client}) : _client = client;

  @override
  Future<Map<String, dynamic>> getCurrencies() async {
    return _client.httpsGet(path: _currencies);
  }

  @override
  Future<Map<String, dynamic>> convertCurrency({
    required ConversionModel conversionModel,
  }) {
    return _client.httpsGet(
      path: _latest,
      queryParameters: conversionModel.toJson(),
    );
  }
}
