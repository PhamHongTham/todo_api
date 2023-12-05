class LoginBody {
  String? email;
  String? password;
  LoginBody();
  factory LoginBody.fromJson(Map<String, dynamic> json) {
    return LoginBody()
      ..email = json['email']
      ..password = json['password'];
  }
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
