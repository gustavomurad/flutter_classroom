import 'package:flutter/material.dart';

class RoundedTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const RoundedTextButton({
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: key,
      style: TextButton.styleFrom(
        backgroundColor: Colors.black87,
        minimumSize: const Size(100, 60),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(29),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
