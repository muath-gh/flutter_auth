import 'package:auth_playground/services/api/auth_api.dart';
import 'package:auth_playground/services/responses/login_response.dart';

abstract class AuthRepo {
  Future<LoginResponse> login(String email, String password);
}

class RealAuthRepo extends AuthRepo {
  AuthApi _authApi = AuthApi();
  @override
  Future<LoginResponse> login(String email, String password) {
    return _authApi.login(email, password);
    // TODO: implement login
  }
}
