import 'package:ranked_padel/models/auth/user.dart';
import 'package:ranked_padel/services/auth/authentication_service.dart';

class LoginViewModel {
  final AuthenticationService _authService = AuthenticationService();

  Future<User?> login(String username, String password) {
    return _authService.login(username, password);
  }
}
