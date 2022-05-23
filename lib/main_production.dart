import 'package:flutter/material.dart';
import 'package:flutter_classroom/src/app.dart';
import 'package:flutter_classroom/src/core/flavors/flavor_config.dart';

void main() {
  FlavorConfig.production();

  runApp(const MyApp());
}
