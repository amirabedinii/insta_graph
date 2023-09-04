import 'dart:convert';
import 'dart:developer';
import 'package:insta_graph/models/api/authentication/authentication_model.dart';
import 'package:insta_graph/network/http_helper.dart';

class AuthenticationRepository {
  final HttpHelper _httpHelper = HttpHelper();

  Future<AuthenticationModel> logIn({
    required String username,
    required String password,
  }) {
    return _httpHelper
        .httpPost('accounts/login', data: {
      'username': username,
      'password': password,
    }).then(
      (value) => AuthenticationModel.fromJson(
        jsonDecode(
          jsonEncode(value.data),
        ),
      ),
    );
  }

  Future<AuthenticationModel> signUp({
    required String firstName,
    required String lastName,
    required String username,
    required String emailOrPhone,
    required String password,
  }) {
    return _httpHelper.httpPost(
      'accounts/signup',
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
        'email': emailOrPhone,
        'password': password,
      },
    ).then(
      (value) {
        log(value.toString());
        return AuthenticationModel.fromJson(
            jsonDecode(jsonEncode(value.data)));
      },
    );
  }
}
