import 'dart:io';

import 'package:flutter_classroom/src/core/services/http_client_impl.dart';
import 'package:flutter_classroom/src/core/services/http_exception.dart';
import 'package:flutter_classroom/src/core/services/http_messages.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'http_client_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<http.Client>(as: #ClientMock),
])
main() {
  const String httpsPath = '/httpsGet';
  const String httpPath = '/httpGet';
  const String authority = 'api.frankfurter.app';

  final httpsUri = Uri.https(authority, httpsPath);
  final httpUri = Uri.http(authority, httpPath);

  final response200 = http.Response('{}', 200);
  final response401 = http.Response('Error 401', 401);
  final response400 = http.Response('Error 400', 400);
  final response500 = http.Response('Error 500', 500);

  final http.Client client = ClientMock();
  final httpClient = HttpClientImpl(client: client, authority: authority);

  group('Tests on HttpClient get method', () {
    test('Test Https get get method with 200 response ', () async {
      when(client.get(httpsUri)).thenAnswer((_) async => response200);

      expect(
        await httpClient.httpsGet(path: httpsPath),
        isA<Map<String, dynamic>>(),
      );
    });

    test('Test http get method with 200 response ', () async {
      when(client.get(httpUri)).thenAnswer((_) async => response200);

      expect(
        await httpClient.httpGet(path: httpPath),
        isA<Map<String, dynamic>>(),
      );
    });

    test('Test https get method with 401 response', () async {
      const errorMessage = '${HttpMessages.authenticationException}: Error 401';

      when(client.get(httpsUri)).thenAnswer((_) async => response401);

      expect(
        () => httpClient.httpsGet(path: httpsPath),
        throwsA(
          isA<AuthenticationException>()
              .having((error) => error.toString(), 'message', errorMessage),
        ),
      );
    });

    test('Test http get method with 401 response', () async {
      const errorMessage = '${HttpMessages.authenticationException}: Error 401';

      when(client.get(httpUri)).thenAnswer((_) async => response401);

      expect(
        () => httpClient.httpGet(path: httpPath),
        throwsA(
          isA<AuthenticationException>()
              .having((error) => error.toString(), 'message', errorMessage),
        ),
      );
    });

    test('Test https get method with 400 response', () async {
      const errorMessage = '${HttpMessages.businessException}: Error 400';

      when(client.get(httpsUri)).thenAnswer((_) async => response400);

      expect(
        () => httpClient.httpsGet(path: httpsPath),
        throwsA(
          isA<BusinessException>()
              .having((error) => error.toString(), 'message', errorMessage),
        ),
      );
    });

    test('Test http get method with 400 response', () async {
      const errorMessage = '${HttpMessages.businessException}: Error 400';

      when(client.get(httpUri)).thenAnswer((_) async => response400);

      expect(
        () => httpClient.httpGet(path: httpPath),
        throwsA(
          isA<BusinessException>()
              .having((error) => error.toString(), 'message', errorMessage),
        ),
      );
    });

    test('Test https get method with 500 response', () async {
      const errorMessage = '${HttpMessages.serverException}: Error 500';

      when(client.get(httpsUri)).thenAnswer((_) async => response500);

      expect(
        () => httpClient.httpsGet(path: httpsPath),
        throwsA(
          isA<ServerException>()
              .having((error) => error.toString(), 'message', errorMessage),
        ),
      );
    });

    test('Test http get method with 500 response', () async {
      const errorMessage = '${HttpMessages.serverException}: Error 500';

      when(client.get(httpUri)).thenAnswer((_) async => response500);

      expect(
        () => httpClient.httpGet(path: httpPath),
        throwsA(
          isA<ServerException>()
              .having((error) => error.toString(), 'message', errorMessage),
        ),
      );
    });

    test('Test https get method with exception', () async {
      const errorMessage =
          '${HttpMessages.connectionException}: ${HttpMessages.noInternetConnectionMessage}';

      when(client.get(httpsUri)).thenThrow(const SocketException('Error'));

      expect(
        () async => httpClient.httpsGet(path: httpsPath),
        throwsA(
          isA<ConnectionException>()
              .having((error) => error.toString(), 'message', errorMessage),
        ),
      );
    });

    test('Test http get method with exception', () async {
      const errorMessage =
          '${HttpMessages.connectionException}: ${HttpMessages.noInternetConnectionMessage}';

      when(client.get(httpUri)).thenThrow(const SocketException('Error'));

      expect(
        () async => httpClient.httpGet(path: httpPath),
        throwsA(
          isA<ConnectionException>()
              .having((error) => error.toString(), 'message', errorMessage),
        ),
      );
    });
  });
}
