import 'package:auth_playground/models/user.dart';
import 'package:auth_playground/repositories/auth_repo.dart';
import 'package:auth_playground/services/responses/login_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  AuthRepo authRepo;
  FlutterSecureStorage _storage = null;
  AuthProvider(this.authRepo) {
    _storage = FlutterSecureStorage();
  }
  User _user;
  String _token;
  bool _isLoggedIn = false;
  User get user => _user;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String email, String password) async {
    LoginResponse response = await authRepo.login(email, password);
    if (response.success == "success" && response.data != null) {
      _user = response.data;
      _token = response.token;
      await _storage.write(key: "access_token", value: _token);
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  Future<String> getToken() async {
    final String token = await _storage.read(key: "access_token");
    return token;
  }
}
