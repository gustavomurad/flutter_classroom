import 'package:flutter_classroom/src/features/currency_converter/data/repository/currency_repository.dart';
import 'package:flutter_classroom/src/features/currency_converter/data/services/currency_service.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/currency_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyService _service;

  CurrencyRepositoryImpl({
    required CurrencyService service,
  }) : _service = service;

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    final Map<String, dynamic> json = await _service.getCurrencies();

    List<CurrencyModel> list = <CurrencyModel>[];

    json.forEach((key, value) {
      list.add(CurrencyModel(id: key, description: value));
    });

    return list;
  }

  @override
  Future<ExchangeRateModel> convertCurrency({
    required ConversionModel conversionModel,
  }) async {
    final Map<String, dynamic> json = await _service.convertCurrency(
      conversionModel: conversionModel,
    );

    return ExchangeRateModel.fromJson(json: json);
  }
}
