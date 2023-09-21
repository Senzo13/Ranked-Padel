// lib/services/auth_service.dart

import 'package:dio/dio.dart';
import 'package:ranked_padel/services/api/core/dio_service.dart';
import 'package:ranked_padel/constants/api_constants.dart';
import 'package:ranked_padel/utils/preferences/user_preferences.dart';

class AuthService {
  final DioService _dioService = DioService();

  Future<Response?> login(Map<String, dynamic> credentials) async {
    final response =
        await _dioService.post(ApiConstants.LOGIN_ENDPOINT, data: credentials);

    if (response != null && response.statusCode == 200) {
      // Supposons que le token soit dans la réponse sous 'token'
      UserPreferences().setToken(response.data['token']);
    }

    return response;
  }

  Future<Response?> register(Map<String, dynamic> data) async {
    final response =
        await _dioService.post(ApiConstants.REGISTER_ENDPOINT, data: data);

    if (response != null && response.statusCode == 200) {
      // Supposons que le token soit dans la réponse sous 'token'
      UserPreferences().setToken(response.data['token']);
    }

    return response;
  }
}
