import '../base_api_model.dart';

class AuthenticationModel extends BaseApiModel {
  final String? token;
  final String? refreshToken;
  final String? code;
  final String? username;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? email;
  const AuthenticationModel({
    this.token,
    this.refreshToken,
    this.code,
    this.username,
    this.password,
    this.firstName,
    this.lastName,
    this.email,
    String ? message,
    String ? status ,

  }):super(message:message,status: status ,);

  factory AuthenticationModel.fromJson(Map<String, dynamic> map) {
    return AuthenticationModel(
      token: map['access_token'] as String,
      refreshToken: map['refresh'] as String,
      code: map['Code'] as String,
      username: map["Fields"]['username'] as String,
      password: map["Fields"]['password'] as String,
      firstName: map["Fields"]['first_name'] as String,
      lastName: map["Fields"]['last_name'] as String,
      email: map["Fields"]['email'] as String,
      message: map['message'] as String,
      status: map['status'] as String,
    );
  }

  @override
  List<Object?> get props => [
        token,
        refreshToken,
        code,
        username,
        password,
        firstName,
        lastName,
        email,
      ];
}
