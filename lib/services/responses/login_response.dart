import '../../models/user.dart';

class LoginResponse {
  String success;
  String token;
  User data;
  String message;

  LoginResponse({this.success, this.data, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'].toString();
    token = json['token'].toString();
    if (json['data'] != null) {
      Map<String, dynamic> userData = json['data'] as Map<String, dynamic>;
      data = User.fromJson(userData);
    }
    message = json['message'].toString();
  }

  LoginResponse.withError(String error) {
    success = "failure";
    data = null;
    message = error;
    token = null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['token'] = this.token;

    return data;
  }
}
