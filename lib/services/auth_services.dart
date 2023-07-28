import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  AuthServices._privateConstructor();

  static final AuthServices _instance = AuthServices._privateConstructor();

  factory AuthServices() {
    return _instance;
  }

  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  String? token;
  String? refreshToken;

  Future updateToken(String token) async {
    this.token = token;
    (await prefs).setString('token', token);
  }

  Future updateRefreshToken(String refreshToken) async {
    this.refreshToken = refreshToken;
    (await prefs).setString('refresh_token', refreshToken);
  }

  Future init() async {
    final p = await prefs;
    token = p.getString('token') ?? '';
    refreshToken = p.getString('refresh_token') ?? '';
  }

  Future logOut() async {
    updateToken('');
    updateRefreshToken('');
  }
}
