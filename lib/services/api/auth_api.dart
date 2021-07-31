import 'dart:convert';

import 'package:auth_playground/screens/login_screen.dart';
import 'package:auth_playground/services/responses/login_response.dart';
import 'package:dio/dio.dart';

import '../../utils/app_constants.dart';

class AuthApi {
  final String _baseUrl = AppConstants.BASE_URL + "api/";
  Dio _dio;

  AuthApi() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 15000, connectTimeout: 15000);
    _dio = Dio(options);
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      var customHeaders = {
        'content-type': 'application/json',
      };
      options.headers.addAll(customHeaders);
      return options;
    }));
  }

  Future<LoginResponse> login(String email, String password) async {
    print(_baseUrl + "signin");
    Response<Map<String, dynamic>> response = await _dio.post(
      _baseUrl + "signin",
      data: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    return LoginResponse.fromJson(response.data);
  }
}
