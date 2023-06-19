import 'package:dartz/dartz.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

class Response {
  final int statusCode;
  final String? statusMessage;
  final dynamic data;

  Response({
    this.statusMessage,
    this.data = const {},
    required this.statusCode,
  });
  @override
  String toString() {
    return 'statusCode=$statusCode\nstatusMessage=$statusMessage\n data=$data';
  }
}

extension ResponseExtension on Response {
  Right<AppException, Response> get toRight => Right(this);
}
