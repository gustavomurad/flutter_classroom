import 'package:flutter/material.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/components/rounded_text_button.dart';

class CurrencyDetailUI extends StatelessWidget {
  final ExchangeRateModel? exchangeRateModel;

  const CurrencyDetailUI({
    Key? key,
    this.exchangeRateModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(exchangeRateModel?.toString() ?? ''),
              const SizedBox(
                height: 30,
              ),
              RoundedTextButton(
                label: 'Fechar',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
