import 'package:flutter/material.dart';

class ErrorDialog {
  static Future<void> show({
    required String message,
    required BuildContext context,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            elevation: 25,
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.error,
                    key: Key('error-dialog-icon'),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    message,
                    key: const Key('error-dialog-message'),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                key: const Key('error-ok-button'),
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}
