part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object?> get props => [];
}

class GetCurrenciesEvent extends CurrencyEvent {
  const GetCurrenciesEvent();
}

class ConvertCurrencyEvent extends CurrencyEvent {
  final ConversionModel conversionModel;

  const ConvertCurrencyEvent({required this.conversionModel});

  @override
  List<Object> get props => [conversionModel];
}
