import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:insta_graph/models/api/authentication/login_model.dart';
import 'package:insta_graph/models/api/authentication/user_model.dart';
import 'package:insta_graph/network/http_helper.dart';

import '../../models/api/base_responce.dart';

abstract class AuthenticationRepository {
  Future<ResponseModel<UserModel>> signUp({
    required String firstName,
    required String lastName,
    required String username,
    required String emailOrPhone,
    required String password,
  });

  Future<ResponseModel<LoginModel>> logIn({
    required String username,
    required String password,
  });
}

@Singleton(as: AuthenticationRepository)
class AuthenticationRepositorySingelton implements AuthenticationRepository {
  final HttpHelper _httpHelper = HttpHelper();

  @override
  Future<ResponseModel<LoginModel>> logIn({
    required String username,
    required String password,
  }) {
    return _httpHelper.httpPost('', data: {
      'username': username,
      'password': password,
    }).then(
      (value) => ResponseModel<LoginModel>.fromJson(
          jsonDecode(jsonEncode(value.data))),
    );
  }

  @override
  Future<ResponseModel<UserModel>> signUp(
      {required String firstName,
      required String lastName,
      required String username,
      required String emailOrPhone,
      required String password}) {
    return _httpHelper.httpPost('', data: {
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'email': emailOrPhone,
      'password': password,
    }).then(
      (value) =>
          ResponseModel<UserModel>.fromJson(jsonDecode(jsonEncode(value.data))),
    );
  }
}
