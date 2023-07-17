import 'package:equatable/equatable.dart';

abstract class BaseApiModel extends Equatable {
  const BaseApiModel();

  Map<String, dynamic> toJson();
}
