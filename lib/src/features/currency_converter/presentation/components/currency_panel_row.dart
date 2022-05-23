import 'package:flutter/material.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/helpers/rounded_flags_helper.dart';

class CurrencyPanelRow extends StatelessWidget {
  final String amount;
  final String currency;
  final TextStyle? textStyle;

  const CurrencyPanelRow({
    Key? key,
    required this.amount,
    required this.currency,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedFlag.get(
          currencySymbol: currency,
          height: 40,
          width: 40,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            '$amount $currency',
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
