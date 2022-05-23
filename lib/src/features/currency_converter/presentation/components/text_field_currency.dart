import 'package:flutter/material.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/input_formatters/decimal_text_input_formatter.dart';

class TextFieldCurrency extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String? suffixText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  const TextFieldCurrency({
    required this.labelText,
    this.hintText,
    this.suffixText,
    this.validator,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(labelText),
          ),
          TextFormField(
            key: key,
            keyboardType: TextInputType.number,
            inputFormatters: [DecimalTextInputFormatter()],
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              hintText: hintText,
              suffixText: suffixText,
              filled: false,
            ),
          ),
        ],
      ),
    );
  }
}
