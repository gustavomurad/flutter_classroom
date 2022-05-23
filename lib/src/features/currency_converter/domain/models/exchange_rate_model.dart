import 'package:equatable/equatable.dart';
import 'package:flutter_classroom/src/core/exceptions/exceptions.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/rate_model.dart';

class ExchangeRateModel extends Equatable {
  final num amount;
  final String base;
  final DateTime date;
  final List<RateModel> rates;

  const ExchangeRateModel({
    required this.amount,
    required this.base,
    required this.date,
    required this.rates,
  });

  factory ExchangeRateModel.fromJson({required Map<String, dynamic> json}) =>
      json.isNotEmpty
          ? ExchangeRateModel(
              amount: json['amount'],
              base: json['base'],
              date: DateTime.parse(json['date']).toLocal(),
              rates: _getRatesFromMap(json: json['rates']),
            )
          : throw const JsonParseException(
              message: 'ExchangeRateModel.fromJson receive a empty json',
            );

  static List<RateModel> _getRatesFromMap(
      {required Map<String, dynamic> json}) {
    List<RateModel> rates = [];
    json.forEach(
      (key, value) => rates.add(RateModel(id: key, amount: value)),
    );
    return rates;
  }

  @override
  List<Object> get props => [amount, base, date];
}
