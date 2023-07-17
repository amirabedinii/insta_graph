import 'package:insta_graph/models/api/authentication/user_model.dart';
import 'package:insta_graph/models/api/base_api_model.dart';

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
  final String? message;
  final String? error;
  final DataModel<T>? dataModel;

  ResponseModel({
    this.message,
    this.error,
    this.dataModel,
  });

  Map<String, dynamic> toJSon() {
    return <String, dynamic>{
      if (message != null) 'message': message,
      if (error != null) 'non_field_errors': error,
      if (dataModel != null) responseData[T]!: dataModel!.toJson()
    };
  }

  factory ResponseModel.fromJson(Map<String, dynamic> map) {
    return ResponseModel<T>(
      message: map['message'] != null ? map['message'] as String : null,
      error: map['non_field_errors'] != null
          ? map['non_field_errors'] as String
          : null,
      dataModel: DataModel<T>.fromJson(map[responseData[T]] ?? ''),
    );
  }
}

final dataFactoryModels = <Type, DataFactory>{
  UserModel: (Map<String, dynamic> json) => UserModel.fromJson(json),
};

final responseData = <Type, String>{
  UserModel: 'Account',
};

class DataModel<T extends BaseApiModel> {
  final List<T> result;
  DataModel({
    required this.result,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'result': result.map((e) => e.toJson()).toList(),
    };
  }

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      result: (json['result'] as List<dynamic>)
          .map((item) => makeModel<T>(item))
          .toList(),
    );
  }
}
