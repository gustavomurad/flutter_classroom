import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/user_interfaces/currency_converter_ui.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/user_interfaces/currency_detail_ui.dart';

part 'application_routes.dart';

class RouterNavigator {
  static const String initialRoute = ApplicationRoutes.currencyConverterUi;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case ApplicationRoutes.currencyConverterUi:
        return MaterialPageRoute(
          builder: (_) => const CurrencyConverterUi(),
          settings: settings,
        );
      case ApplicationRoutes.currencyDetailUi:
        ExchangeRateModel? model;
        if (args != null) model = (args as ExchangeRateModel);

        return MaterialPageRoute(
          builder: (_) => CurrencyDetailUI(
            exchangeRateModel: model,
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CurrencyConverterUi(),
        );
    }
  }

  static Route<dynamic> _popFromBottomRoute(
    Widget page, [
    RouteSettings? settings,
  ]) =>
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: const Duration(milliseconds: 900),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        settings: settings,
      );
}
