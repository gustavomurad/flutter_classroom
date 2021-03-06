// Mocks generated by Mockito 5.0.16 from annotations
// in flutter_classroom/test/src/features/currency_converter/data/repository/currency_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:flutter_classroom/src/features/currency_converter/data/services/currency_service.dart'
    as _i2;
import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [CurrencyService].
///
/// See the documentation for Mockito's code generation for more information.
class CurrencyServiceMock extends _i1.Mock implements _i2.CurrencyService {
  CurrencyServiceMock() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<Map<String, dynamic>> getCurrencies() => (super.noSuchMethod(
          Invocation.method(#getCurrencies, []),
          returnValue: Future<Map<String, dynamic>>.value(<String, dynamic>{}))
      as _i3.Future<Map<String, dynamic>>);
  @override
  _i3.Future<Map<String, dynamic>> convertCurrency(
          {_i4.ConversionModel? conversionModel}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #convertCurrency, [], {#conversionModel: conversionModel}),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i3.Future<Map<String, dynamic>>);
  @override
  String toString() => super.toString();
}
