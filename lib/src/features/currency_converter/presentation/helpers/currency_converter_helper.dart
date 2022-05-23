import 'package:flutter/material.dart';

class CurrencyConverterHelper<T> {
  List<DropdownMenuItem<T>> generateCurrenciesMenuItem({
    required List<T> currencies,
  }) =>
      currencies
          .map<DropdownMenuItem<T>>(
            (item) => DropdownMenuItem<T>(
              value: item,
              child: Text(item.toString()),
            ),
          )
          .toList();
}
