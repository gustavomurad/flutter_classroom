import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedFlag {
  static Widget get({
    required String currencySymbol,
    double? height,
    double? width,
  }) =>
      SvgPicture.asset(
        'assets/flags/${currencySymbol.toLowerCase()}.svg',
        height: height,
        width: width,
      );
}
