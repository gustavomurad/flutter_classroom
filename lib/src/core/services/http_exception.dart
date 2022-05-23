import 'package:flutter_classroom/src/core/services/http_messages.dart';

abstract class HttpException implements Exception {
  final int code;
  final String prefix;
  final String message;
  final String? cause;

  const HttpException({
    required this.code,
    required this.prefix,
    required this.message,
    this.cause,
  });

  @override
  String toString() => '$prefix: $message';
}

class ConnectionException extends HttpException {
  const ConnectionException({
    required int code,
    required String message,
    String? cause,
  }) : super(
          code: code,
          prefix: HttpMessages.connectionException,
          message: message,
          cause: cause,
        );
}

class AuthenticationException extends HttpException {
  const AuthenticationException({
    required int code,
    required String message,
  }) : super(
          code: code,
          prefix: HttpMessages.authenticationException,
          message: message,
        );
}

class BusinessException extends HttpException {
  const BusinessException({
    required int code,
    required String message,
  }) : super(
          code: code,
          prefix: HttpMessages.businessException,
          message: message,
        );
}

class ServerException extends HttpException {
  const ServerException({
    required int code,
    required String message,
  }) : super(
          code: code,
          prefix: HttpMessages.serverException,
          message: message,
        );
}
