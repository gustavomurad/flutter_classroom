import 'package:flutter/material.dart';
import 'dart:ui' show window;

class _TestAppMock extends StatefulWidget {
  const _TestAppMock({
    Key? key,
    required this.textDirection,
    required this.child,
    this.mediaSize,
  }) : super(key: key);

  final TextDirection textDirection;
  final Widget child;
  final Size? mediaSize;

  @override
  State<_TestAppMock> createState() => _TestAppMockState();
}

class _TestAppMockState extends State<_TestAppMock> {
  @override
  Widget build(BuildContext context) {
    return Localizations(
      locale: const Locale('en', 'US'),
      delegates: const <LocalizationsDelegate<dynamic>>[
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
      ],
      child: MediaQuery(
        data: MediaQueryData.fromWindow(window).copyWith(
          size: widget.mediaSize,
        ),
        child: Directionality(
          textDirection: widget.textDirection,
          child: Navigator(
            onGenerateRoute: (RouteSettings settings) {
              assert(settings.name == '/');
              return MaterialPageRoute<void>(
                settings: settings,
                builder: (BuildContext context) => widget.child,
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget buildMock({
  required Widget subject,
}) =>
    _TestAppMock(
      textDirection: TextDirection.ltr,
      child: Material(
        child: Center(
          child: Align(
            alignment: Alignment.center,
            child: RepaintBoundary(
              child: subject,
            ),
          ),
        ),
      ),
    );
