import 'package:ranked_padel/models/auth/user.dart';
import 'package:ranked_padel/services/api/auth/authentication_service.dart';

class LoginViewModel {
  final AuthService _authService = AuthService();

  Future<User?> login(String username, String password) async {
    final response =
        await _authService.login({'username': username, 'password': password});

    if (response != null && response.statusCode == 200) {
      // Convertir la réponse en objet User
      return User(id: response.data['id'], username: response.data['username']);
    }

    return null;
  }
}
