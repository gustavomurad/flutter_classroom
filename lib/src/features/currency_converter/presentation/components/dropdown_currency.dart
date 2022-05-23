import 'package:flutter/material.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/currency_model.dart';

class DropdownCurrency extends StatelessWidget {
  final String _labelText;
  final Widget? _hint;
  final CurrencyModel? _value;
  final FormFieldSetter<CurrencyModel>? _onSaved;
  final ValueChanged<CurrencyModel?>? _onChanged;
  final List<DropdownMenuItem<CurrencyModel>> _items;

  const DropdownCurrency({
    required String labelText,
    Widget? hint,
    CurrencyModel? value,
    FormFieldSetter<CurrencyModel>? onSaved,
    ValueChanged<CurrencyModel?>? onChanged,
    required List<DropdownMenuItem<CurrencyModel>> items,
    Key? key,
  })  : _labelText = labelText,
        _hint = hint,
        _value = value,
        _onSaved = onSaved,
        _onChanged = onChanged,
        _items = items,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(_labelText),
          ),
          DropdownButtonFormField<CurrencyModel>(
            key: key,
            hint: _hint,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              filled: false,
            ),
            value: _value,
            onSaved: _onSaved,
            onChanged: _onChanged,
            items: _items,
          )
        ],
      ),
    );
  }
}
