import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ConversionModel conversionModel = ConversionModel(
    amount: 200,
    from: 'USD',
    to: 'BRL',
  );

  group('Tests on ConversionModel', () {
    test(
      'Should be a same type of ConversionModel',
      () => expect(conversionModel, isA<ConversionModel>()),
    );

    test(
      'Test Equatable props values',
      () => expect(conversionModel.props, [200, 'USD', 'BRL']),
    );

    test('Call toJson', () {
      final json = conversionModel.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['amount'], 200);
      expect(json['from'], 'USD');
      expect(json['to'], 'BRL');
    });
  });
}
