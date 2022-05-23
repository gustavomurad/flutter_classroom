import 'package:flutter_classroom/src/features/currency_converter/domain/models/rate_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const RateModel rateModel = RateModel(id: 'USD', amount: 50.35);

  group('Tests on RateModel', () {
    test(
      'Model is a RateModel instance',
      () => expect(rateModel, isA<RateModel>()),
    );

    test(
      'Test Equatable props values',
      () => expect(rateModel.props, ['USD', 50.35]),
    );
    test('Test id attribute on RateModel', () {
      expect(rateModel.id, isA<String>());
      expect(rateModel.id, 'USD');
    });

    test('Test amount attribute on RateModel', () {
      expect(rateModel.amount, isA<double>());
      expect(rateModel.amount, 50.35);
    });
  });
}
