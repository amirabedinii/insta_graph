import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  AuthServices._privateConstructor();

  static final AuthServices _instance = AuthServices._privateConstructor();

  factory AuthServices() {
    return _instance;
  }

  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  String get token => _token ?? '';
  String get refreshToken => _refreshToken ?? '';

  String? _token;
  String? _refreshToken;

  Future updateToken(String token) async {
    _token = token;
    (await prefs).setString('token', token);
  }

  Future updateRefreshToken(String refreshToken) async {
    _refreshToken = refreshToken;
    (await prefs).setString('refresh_token', refreshToken);
  }

  Future init() async {
    final p = await prefs;
    _token = p.getString('token') ?? '';
    _refreshToken = p.getString('refresh_token') ?? '';
  }

  Future logOut() async {
    updateToken('');
    updateRefreshToken('');
  }
}
