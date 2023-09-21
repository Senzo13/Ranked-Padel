// lib/services/dio_service.dart

import 'package:dio/dio.dart';
import 'package:ranked_padel/constants/api_constants.dart';

class DioService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.BASE_URL));

  // GET
  Future<Response?> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameters);
    } catch (error) {
      print('Erreur GET: $error');
      return null;
    }
  }

  // POST
  Future<Response?> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (error) {
      print('Erreur POST: $error');
      return null;
    }
  }

  // Récupérer les headers
  Map<String, dynamic>? getHeaders() {
    return _dio.options.headers;
  }

  // Ajouter des headers
  void setHeaders(Map<String, dynamic> headers) {
    _dio.options.headers.addAll(headers);
  }

  // PUT
  Future<Response?> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } catch (error) {
      print('Erreur PUT: $error');
      return null;
    }
  }

  // DELETE
  Future<Response?> delete(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.delete(endpoint, queryParameters: queryParameters);
    } catch (error) {
      print('Erreur DELETE: $error');
      return null;
    }
  }

  // PATCH
  Future<Response?> patch(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.patch(endpoint, data: data);
    } catch (error) {
      print('Erreur PATCH: $error');
      return null;
    }
  }
}
