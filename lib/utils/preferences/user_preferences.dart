import 'package:shared_preferences/shared_preferences.dart';
import 'package:ranked_padel/utils/decode_token.dart';

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

  Future<bool> isTokenValid(token) async {
    final tokenData = decodeJwt(
        token); // Utilisez la fonction decodeJwt pour décoder le token

    if (tokenData == null || !tokenData.containsKey('exp')) {
      return false; // Le token n'est pas valide ou ne contient pas la date d'expiration
    }

    final expirationTimestamp =
        tokenData['exp'] as int; // Date d'expiration en timestamp
    final currentTime = DateTime.now().millisecondsSinceEpoch ~/
        1000; // Temps actuel en secondes

    return currentTime <
        expirationTimestamp; // Vérifie si la date actuelle est avant la date d'expiration
  }

  Future<bool> isAuthenticated() async {
    final token = await getToken();

    if (token == null || token.isEmpty) {
      return false; // Pas de token, donc non authentifié
    }

// Utilisez la fonction isTokenValid pour vérifier si le token est valide
    final isTokenValid = this.isTokenValid(token);

    return isTokenValid;
  }
}
