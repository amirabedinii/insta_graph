import '../base_api_model.dart';

class LoginModel extends BaseApiModel {
  final String? username;
  final String? password;
  const LoginModel({
    this.username,
    this.password,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
