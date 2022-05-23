import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/components/currency_panel_row.dart';

class CurrencyPanel extends StatelessWidget {
  final ExchangeRateModel? exchangeRate;
  final GestureTapCallback? onTap;

  const CurrencyPanel({
    this.exchangeRate,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _amountFrom = exchangeRate?.amount.toStringAsFixed(2) ?? '';
    final _currencyFrom = exchangeRate?.base ?? '';
    final _currencyTo = exchangeRate?.rates.first.id ?? '';
    final _amountTo = exchangeRate?.rates.first.amount.toStringAsFixed(2) ?? '';
    final TextStyle? _textStyle =
        Theme.of(context).textTheme.headline3?.copyWith(
              fontWeight: FontWeight.bold,
            );

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
              top: Radius.circular(30),
            ),
            color: Colors.orange,
          ),
          child: exchangeRate != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CurrencyPanelRow(
                      amount: _amountFrom,
                      currency: _currencyFrom,
                      textStyle: _textStyle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CurrencyPanelRow(
                      amount: _amountTo,
                      currency: _currencyTo,
                      textStyle: _textStyle,
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
