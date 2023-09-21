import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();
  SharedPreferences? _prefs;

  static const _tokenKey = 'auth_token';

  UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  Future<SharedPreferences?> get prefs async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }

  Future<void> setToken(String token) async {
    final preferences = await prefs;
    preferences?.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final preferences = await prefs;
    return preferences?.getString(_tokenKey);
  }

  Future<void> removeToken() async {
    final preferences = await prefs;
    preferences?.remove(_tokenKey);
  }

  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
