import 'package:flutter/foundation.dart';

class CustomHttpException implements Exception {
  final Object type;
  final String? error;
  final String? message;

  CustomHttpException(this.type, [this.error, this.message]) {
    debugPrintStack(label: toString());
  }

  @override
  String toString() {
    return "$type ${error ?? ""} ${message ?? ""}";
  }
}

class ForbiddenException extends CustomHttpException {
  final String url;

  ForbiddenException(this.url, [String? error, String? message])
      : super(UnauthorizedException, error, message);

  @override
  String toString() => 'UnauthorizedException in $url';
}

class InvalidInputException extends CustomHttpException {
  final String url;

  InvalidInputException(this.url, [String? error, String? message])
      : super(InvalidInputException, error, message);

  @override
  String toString() => 'InvalidInputException in $url';
}

class SocketException extends CustomHttpException {
  final String url;

  SocketException(this.url, [String? error, String? message])
      : super(SocketException, error, message);

  @override
  String toString() => 'SocketException in $url';
}

class NotFoundException extends CustomHttpException {
  final String url;

  NotFoundException(this.url, [String? error, String? message])
      : super(NotFoundException, error, message);

  @override
  String toString() => 'NotFoundException in $url';
}

class TooManyRequestException extends CustomHttpException {
  final String url;

  TooManyRequestException(this.url, [String? error, String? message])
      : super(TooManyRequestException, error, message);

  @override
  String toString() => 'TooManyRequestException in $url';
}

class ServerException extends CustomHttpException {
  final String url;

  ServerException(this.url, [String? error, String? message])
      : super(ServerException, error, message);

  @override
  String toString() => 'ServerException in $url';
}

class NotHandleException extends CustomHttpException {
  final String url;

  NotHandleException(this.url, [String? error, String? message])
      : super(NotHandleException, error, message);

  @override
  String toString() => 'NotHandleException in $url';
}

class UnauthorizedException extends CustomHttpException {
  final String url;

  UnauthorizedException(this.url, [String? error, String? message])
      : super(UnauthorizedException, error, message);

  @override
  String toString() => 'UnauthorisedException in $url';
}

class BadRequestException extends CustomHttpException {
  final String url;
  final Map<String, dynamic> json;

  BadRequestException(this.url, this.json, [String? error, String? message])
      : super(BadRequestException, error, message);

  @override
  String toString() => 'BadRequestException in $url';
}
