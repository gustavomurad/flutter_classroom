part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

class CurrencyInitialState extends CurrencyState {
  const CurrencyInitialState();
}

class CurrencyLoadingState extends CurrencyState {
  const CurrencyLoadingState();
}

class GetCurrenciesSuccessState extends CurrencyState {
  final List<CurrencyModel> currencies;

  const GetCurrenciesSuccessState({
    required this.currencies,
  });

  @override
  List<Object> get props => [currencies];
}

class ConvertCurrencySuccessState extends CurrencyState {
  final ExchangeRateModel conversion;

  const ConvertCurrencySuccessState({
    required this.conversion,
  });

  @override
  List<Object> get props => [conversion];
}

class CurrencyErrorState extends CurrencyState {
  final String message;

  const CurrencyErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
