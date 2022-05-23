import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoadingDialog {
  static bool _isVisible = false;

  static void dismiss({
    required BuildContext context,
  }) {
    if (_isVisible) {
      _isVisible = false;
      Navigator.of(
        context,
        rootNavigator: true,
      ).pop();
    }
  }

  static Future<void> show({
    required BuildContext context,
  }) async {
    if (!_isVisible) {
      _isVisible = true;
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          );
        },
      );
    }
  }
}
