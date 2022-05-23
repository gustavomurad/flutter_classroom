import 'package:flutter_classroom/src/core/flavors/flavor_config.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Tests on FlavorConfig', () {
    test('Test FlavorConfig on Production', () {
      FlavorConfig.production();

      expect(FlavorConfig.instance, isNotNull);
      expect(FlavorConfig.instance.flavor, Flavor.production);
      expect(FlavorConfig.instance.flavor.isProduction, true);
      expect(FlavorConfig.instance.flavor.isStaging, false);
      expect(FlavorConfig.instance.flavor.isDevelopment, false);
      expect(FlavorConfig.instance.name, 'Production');
      expect(FlavorConfig.instance.values.baseUrl, 'api.frankfurter.app');
    });

    test('Test FlavorConfig on QA', () {
      FlavorConfig.staging();

      expect(FlavorConfig.instance, isNotNull);
      expect(FlavorConfig.instance.flavor, Flavor.staging);
      expect(FlavorConfig.instance.name, 'Staging');
      expect(FlavorConfig.instance.flavor.isProduction, false);
      expect(FlavorConfig.instance.flavor.isStaging, true);
      expect(FlavorConfig.instance.flavor.isDevelopment, false);
      expect(FlavorConfig.instance.values.baseUrl, 'api.frankfurter.app');
    });

    test('Test FlavorConfig on Dev', () {
      FlavorConfig.development();

      expect(FlavorConfig.instance, isNotNull);
      expect(FlavorConfig.instance.flavor, Flavor.development);
      expect(FlavorConfig.instance.flavor.isProduction, false);
      expect(FlavorConfig.instance.flavor.isStaging, false);
      expect(FlavorConfig.instance.flavor.isDevelopment, true);

      expect(FlavorConfig.instance.name, 'Development');
      expect(FlavorConfig.instance.values.baseUrl, 'api.frankfurter.app');
    });
  });
}
