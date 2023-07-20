import 'dart:convert';
import 'package:insta_graph/models/api/authentication/login_model.dart';
import 'package:insta_graph/models/api/authentication/user_model.dart';
import 'package:insta_graph/network/http_helper.dart';

import '../../models/api/base_responce.dart';

class AuthenticationRepository {
  final HttpHelper _httpHelper = HttpHelper();

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
