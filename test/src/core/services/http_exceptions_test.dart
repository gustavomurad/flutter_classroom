import 'package:flutter_classroom/src/core/services/http_exception.dart';
import 'package:flutter_classroom/src/core/services/http_messages.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Tests on HttpExceptions', () {
    test('Test ConnectionException', () {
      const exception = ConnectionException(code: 1, message: 'Error');
      const message = '${HttpMessages.connectionException}: Error';

      expect(exception.toString(), message);
    });

    test('Test AuthenticationException', () {
      const exception = AuthenticationException(code: 1, message: 'Error');
      const message = '${HttpMessages.authenticationException}: Error';

      expect(exception.toString(), message);
    });

    test('Test BusinessException', () {
      const exception = BusinessException(code: 1, message: 'Error');
      const message = '${HttpMessages.businessException}: Error';

      expect(exception.toString(), message);
    });
    test('Test ServerException', () {
      const exception = ServerException(code: 1, message: 'Error');
      const message = '${HttpMessages.serverException}: Error';

      expect(exception.toString(), message);
    });
  });
}
