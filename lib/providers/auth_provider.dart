import 'package:auth_playground/models/user.dart';
import 'package:auth_playground/repositories/auth_repo.dart';
import 'package:auth_playground/services/responses/login_response.dart';
import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  AuthRepo authRepo;
  AuthProvider(this.authRepo);
  User _user;
  String _token;
  bool _isLoggedIn = false;
  User get user => _user;
  String get token => _token;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String email, String password) async {
    LoginResponse response = await authRepo.login(email, password);
    if (response.success == "success" && response.data != null) {
      _user = response.data;
      _token = response.token;
      _isLoggedIn = true;
      notifyListeners();
    }
  }
}
