import 'package:flutter/foundation.dart';
import 'package:ranked_padel/models/auth/user.dart';
import 'package:ranked_padel/services/api/auth/authentication_service.dart';

class LoginViewModel with ChangeNotifier {
  final AuthService _authService;
  User? _user;
  String? _errorMessage;
  bool _isLoading = false;

  LoginViewModel({required AuthService authService})
      : _authService = authService;

  User? get user => _user;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _authService
          .login({'username': username, 'password': password});
      if (response != null && response.statusCode == 200) {
        _user =
            User(id: response.data['id'], username: response.data['username']);
      } else {
        _errorMessage =
            "Failed to log in"; // or parse a more specific message from response
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
