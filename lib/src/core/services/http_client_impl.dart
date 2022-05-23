import 'dart:convert';
import 'dart:io';

import 'package:flutter_classroom/src/core/services/http_client.dart';
import 'package:flutter_classroom/src/core/services/http_exception.dart';
import 'package:flutter_classroom/src/core/services/http_messages.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class HttpClientImpl implements HttpClient {
  final http.Client _client;
  final String _authority;

  HttpClientImpl({
    required http.Client client,
    required String authority,
  })  : _client = client,
        _authority = authority;

  @override
  Future<Map<String, dynamic>> httpGet({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    assert(path.startsWith('/'), 'The path must start with "/"!');
    return _get(uri: Uri.http(_authority, path, queryParameters));
  }

  @override
  Future<Map<String, dynamic>> httpsGet({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    assert(path.startsWith('/'), 'The path must start with "/"!');
    return _get(uri: Uri.https(_authority, path, queryParameters));
  }

  Future<Map<String, dynamic>> _get({required Uri uri}) async {
    Map<String, dynamic> responseJson;
    try {
      final response = await _client.get(uri);
      responseJson = returnResponse(response);
    } on SocketException catch (e) {
      developer.log(e.message);
      throw ConnectionException(
        code: -1,
        message: HttpMessages.noInternetConnectionMessage,
        cause: e.message,
      );
    }
    return responseJson;
  }

  Map<String, dynamic> returnResponse(http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode == 200) {
      return jsonDecode(response.body);
    } else if (statusCode == 401) {
      developer.log(response.body.toString());
      throw AuthenticationException(
        code: statusCode,
        message: response.body.toString(),
      );
    } else if (statusCode < 500) {
      developer.log(response.body.toString());
      throw BusinessException(
        code: statusCode,
        message: response.body.toString(),
      );
    } else {
      developer.log(response.body.toString());
      throw ServerException(
        code: statusCode,
        message: response.body.toString(),
      );
    }
  }
}
