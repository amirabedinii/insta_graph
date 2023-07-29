import 'dart:convert';
import 'package:insta_graph/models/api/authentication/authentication_model.dart';
import 'package:insta_graph/network/http_helper.dart';

import '../../models/api/base_responce.dart';

class AuthenticationRepository {
  final HttpHelper _httpHelper = HttpHelper();

  Future<ResponseModel<AuthenticationModel>> logIn({
    required String username,
    required String password,
  }) {
    return _httpHelper
        .httpPost('http://49.13.60.63:8000/accounts/login', data: {
      'username': username,
      'password': password,
    }).then(
      (value) => ResponseModel<AuthenticationModel>.fromJson(
        jsonDecode(
          jsonEncode(value.data),
        ),
      ),
    );
  }

  Future<ResponseModel<AuthenticationModel>> signUp({
    required String firstName,
    required String lastName,
    required String username,
    required String emailOrPhone,
    required String password,
  }) {
    return _httpHelper.httpPost(
      'http://49.13.60.63:8000/accounts/signup',
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
        'email': emailOrPhone,
        'password': password,
      },
    ).then(
      (value) {
        return ResponseModel<AuthenticationModel>.fromJson(
            jsonDecode(jsonEncode(value.data)));
      },
    );
  }
}
