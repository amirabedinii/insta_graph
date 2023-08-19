import 'package:equatable/equatable.dart';

abstract class BaseApiModel extends Equatable {
  final String? message;
  final String? status;
  final String? error;
  const BaseApiModel({
    this.message,
    this.status,
    this.error,
  });

}
