import 'package:ranked_padel/models/auth/user.dart';

class AuthenticationService {
  Future<User?> login(String username, String password) {
    // Appel d'api pour récupérer l'utilisateur
    return Future.value(User(id: '1', username: username));
  }
}
