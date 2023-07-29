import 'package:insta_graph/models/api/base_api_model.dart';
import 'authentication/authentication_model.dart';

typedef DataFactory<T extends BaseApiModel> = T Function(
  Map<String, dynamic> json,
);

T makeModel<T extends BaseApiModel>(Map<String, dynamic> json) {
  if (!dataFactoryModels.containsKey(T)) {
    throw TypeError();
  }
  try {
    return dataFactoryModels[T]!(json) as T;
  } catch (_) {
    rethrow;
  }
}

class ResponseModel<T extends BaseApiModel> {
  final T? dataModel;
  final String? status;
  final String? message;
  final String? error;

  ResponseModel({
    this.dataModel,
    this.status,
    this.message,
    this.error,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (dataModel != null) responseData[T]!: dataModel!.toJson(),
      if (status != null) 'status': status,
      if (message != null) 'message': message,
      if (error != null) 'detail': error,
    };
  }

  factory ResponseModel.fromJson(Map<String, dynamic> map) {
    return ResponseModel<T>(
      dataModel: makeModel(map[responseData[T]] ?? ''),
      status: map['status'],
      message: map['message'],
      error: map['detail'],
    );
  }
}

final dataFactoryModels = <Type, DataFactory>{
  AuthenticationModel: (Map<String, dynamic> json) =>
      AuthenticationModel.fromJson(json),
};

final responseData = <Type, String>{
  AuthenticationModel: 'token',
};
