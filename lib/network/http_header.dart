import 'package:insta_graph/services/auth_services.dart';

enum HeaderType {
  authenticated,
  anonymous,
  refreshToken,
}

abstract class HttpHeader {
  static Map<String, dynamic> header({required HeaderType headerType}) {
    AuthServices authServices = AuthServices();
    final token = authServices.token;
    final refreshToken = authServices.refreshToken;

    switch (headerType) {
      case HeaderType.authenticated:
        return {'authorization': 'Bearer $token'};
      case HeaderType.anonymous:
        return {};
      case HeaderType.refreshToken:
        return {'refresh_token': '$refreshToken'};
    }
  }
}
