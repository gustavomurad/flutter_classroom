import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_classroom/src/core/dialogs/error_dialog.dart';
import 'package:flutter_classroom/src/core/dialogs/loading_dialog.dart';
import 'package:flutter_classroom/src/core/navigator/router_navigator.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/currency_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/business_logic_objects/currency_bloc.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/components/currency_panel.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/components/dropdown_currency.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/components/rounded_text_button.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/components/text_field_currency.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/helpers/currency_converter_helper.dart';

class CurrencyConverterUi extends StatefulWidget {
  const CurrencyConverterUi({Key? key}) : super(key: key);

  @override
  _CurrencyConverterUiState createState() => _CurrencyConverterUiState();
}

class _CurrencyConverterUiState extends State<CurrencyConverterUi> {
  List<DropdownMenuItem<CurrencyModel>> currencies = [];
  TextEditingController amount = TextEditingController();
  CurrencyModel? currencyFrom;
  CurrencyModel? currencyTo;
  ExchangeRateModel? exchangeRate;
  CurrencyBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CurrencyBloc>(context);
    bloc?.add(const GetCurrenciesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<CurrencyBloc, CurrencyState>(
        listener: currencyBlocListener,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CurrencyPanel(
                  exchangeRate: exchangeRate,
                  onTap: () => showDetails(),
                ),
                TextFieldCurrency(
                  labelText: 'Currency',
                  controller: amount,
                  suffixText: currencyFrom?.toString(),
                ),
                DropdownCurrency(
                  hint: const Text('Selecione a moeda de origem'),
                  labelText: 'Moeda de origem',
                  value: currencyFrom,
                  onChanged: (value) => setState(() => currencyFrom = value),
                  items: currencies,
                ),
                DropdownCurrency(
                  hint: const Text('Selecione a moeda de destino'),
                  labelText: 'Moeda de destino',
                  value: currencyTo,
                  onChanged: (value) => setState(() => currencyTo = value),
                  items: currencies,
                ),
                RoundedTextButton(
                  label: 'Converter',
                  onPressed: () => convert(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void currencyBlocListener(
    BuildContext context,
    CurrencyState state,
  ) {
    if (state is CurrencyErrorState) {
      dismissLoadingDialog();
      showErrorDialog(context: context, message: state.message);
    } else if (state is CurrencyLoadingState) {
      showLoadingDialog();
    } else if (state is GetCurrenciesSuccessState) {
      setCurrencies(state.currencies);
      dismissLoadingDialog();
    } else if (state is ConvertCurrencySuccessState) {
      setConversionData(state.conversion);
      dismissLoadingDialog();
    }
  }

  void showDetails() => Navigator.of(context).pushNamed(
        ApplicationRoutes.currencyDetailUi,
        arguments: exchangeRate,
      );

  void setCurrencies(List<CurrencyModel> list) {
    setState(() {
      currencies =
          CurrencyConverterHelper<CurrencyModel>().generateCurrenciesMenuItem(
        currencies: list,
      );
    });
  }

  void setConversionData(ExchangeRateModel model) {
    setState(() {
      exchangeRate = model;
    });
  }

  //TODO Converter para form e validar;
  void convert() {
    final double amountValue = double.tryParse(amount.value.text) ?? 0;
    final String from = currencyFrom?.id ?? '';
    final String to = currencyTo?.id ?? '';
    final model = ConversionModel(amount: amountValue, from: from, to: to);
    bloc?.add(ConvertCurrencyEvent(conversionModel: model));
  }

  void dismissLoadingDialog() => LoadingDialog.dismiss(context: context);

  void showLoadingDialog() => LoadingDialog.show(context: context);

  void showErrorDialog({
    required BuildContext context,
    required String message,
  }) =>
      ErrorDialog.show(
        message: message,
        context: context,
      );
}
