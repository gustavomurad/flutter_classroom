// Mocks generated by Mockito 5.0.16 from annotations
// in flutter_classroom/test/src/features/currency_converter/domain/usecases/convert_currency_usecase_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutter_classroom/src/features/currency_converter/data/repository/currency_repository.dart'
    as _i3;
import 'package:flutter_classroom/src/features/currency_converter/domain/models/conversion_model.dart'
    as _i6;
import 'package:flutter_classroom/src/features/currency_converter/domain/models/currency_model.dart'
    as _i5;
import 'package:flutter_classroom/src/features/currency_converter/domain/models/exchange_rate_model.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeExchangeRateModel_0 extends _i1.Fake
    implements _i2.ExchangeRateModel {}

/// A class which mocks [CurrencyRepository].
///
/// See the documentation for Mockito's code generation for more information.
class CurrencyRepositoryMock extends _i1.Mock
    implements _i3.CurrencyRepository {
  CurrencyRepositoryMock() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.CurrencyModel>> getCurrencies() =>
      (super.noSuchMethod(Invocation.method(#getCurrencies, []),
              returnValue:
                  Future<List<_i5.CurrencyModel>>.value(<_i5.CurrencyModel>[]))
          as _i4.Future<List<_i5.CurrencyModel>>);
  @override
  _i4.Future<_i2.ExchangeRateModel> convertCurrency(
          {_i6.ConversionModel? conversionModel}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #convertCurrency, [], {#conversionModel: conversionModel}),
              returnValue: Future<_i2.ExchangeRateModel>.value(
                  _FakeExchangeRateModel_0()))
          as _i4.Future<_i2.ExchangeRateModel>);
  @override
  String toString() => super.toString();
}
