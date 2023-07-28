
import '../base_api_model.dart';

class AuthenticationModel extends BaseApiModel{
  final String? token;
  final String? refreshToken;
  const AuthenticationModel({
    this.token,
    this.refreshToken,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': token,
      'password': refreshToken,
    };
  }

  factory AuthenticationModel.fromJson(Map<String, dynamic> map) {
    return AuthenticationModel(
      token: map['token'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  @override
  List<Object?> get props => [
        token,
        refreshToken,
      ];
}