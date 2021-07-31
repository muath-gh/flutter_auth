class User {
  final String name;
  final String email;
  User({this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'].toString(),
      name: json['name'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    return data;
  }
}
