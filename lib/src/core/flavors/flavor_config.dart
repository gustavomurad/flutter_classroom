import 'package:flutter/material.dart';
import 'package:flutter_classroom/src/core/flavors/flavor_values.dart';

enum Flavor { development, staging, production }

extension FlavorExtension on Flavor {
  bool get isDevelopment => this == Flavor.development;

  bool get isStaging => this == Flavor.staging;

  bool get isProduction => this == Flavor.production;
}

class FlavorConfig {
  static late FlavorConfig _instance;
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  final BannerLocation location;

  const FlavorConfig._internal({
    required this.flavor,
    required this.name,
    required this.color,
    required this.values,
    required this.location,
  });

  factory FlavorConfig.production() {
    _instance = const FlavorConfig._internal(
      flavor: Flavor.production,
      name: 'Production',
      color: Colors.green,
      location: BannerLocation.topStart,
      values: FlavorValues(baseUrl: 'api.frankfurter.app'),
    );
    return _instance;
  }

  factory FlavorConfig.staging() {
    _instance = const FlavorConfig._internal(
      flavor: Flavor.staging,
      name: 'Staging',
      color: Colors.yellow,
      location: BannerLocation.topStart,
      values: FlavorValues(baseUrl: 'api.frankfurter.app'),
    );
    return _instance;
  }

  factory FlavorConfig.development() {
    _instance = const FlavorConfig._internal(
      flavor: Flavor.development,
      name: 'Development',
      color: Colors.red,
      location: BannerLocation.topStart,
      values: FlavorValues(baseUrl: 'api.frankfurter.app'),
    );
    return _instance;
  }

  static FlavorConfig get instance => _instance;
}
