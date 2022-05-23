import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_classroom/src/features/currency_converter/data/repository/currency_repository.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/currency_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/usecases/convert_currency_usecase.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/usecases/get_currencies_usecase.dart';

part 'currency_event.dart';

part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyRepository _repository;

  CurrencyBloc({
    required CurrencyRepository repository,
  })  : _repository = repository,
        super(const CurrencyInitialState()) {
    on<GetCurrenciesEvent>(_onGetCurrenciesEvent);
    on<ConvertCurrencyEvent>(_onConvertCurrencyEvent);
  }

  void _onConvertCurrencyEvent(
    ConvertCurrencyEvent event,
    Emitter<CurrencyState> emit,
  ) async {
    emit(const CurrencyLoadingState());

    final convertCurrency = ConvertCurrencyUsecase(
      repository: _repository,
    );

    try {
      final exchangeRate = await convertCurrency(
        conversionModel: event.conversionModel,
      );

      emit(ConvertCurrencySuccessState(conversion: exchangeRate));
    } catch (exception) {
      emit(
        const CurrencyErrorState(
          message: 'Erro ao obter os dados do Banco Central Europeu',
        ),
      );
    }
  }

  void _onGetCurrenciesEvent(
    GetCurrenciesEvent event,
    Emitter<CurrencyState> emit,
  ) async {
    emit(const CurrencyLoadingState());

    final getCurrenciesUsecase = GetCurrenciesUsecase(
      repository: _repository,
    );

    try {
      final currencies = await getCurrenciesUsecase();

      emit(GetCurrenciesSuccessState(currencies: currencies));
    } catch (exception) {
      emit(
        const CurrencyErrorState(
          message: 'Erro ao obter os dados do Banco Central Europeu',
        ),
      );
    }
  }
}
