import 'package:insta_graph/models/api/base_api_model.dart';

class UserModel extends BaseApiModel {
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? password;
  const UserModel({
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.password,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        username,
        email,
        password,
      ];
}
