class RegisterBody {
  String? email;
  String? name;
  String? password;
  int? age;
  String? code;
  RegisterBody();
  factory RegisterBody.fromJson(Map<String, dynamic> json) {
    return RegisterBody()
      ..name = json['name']
      ..email = json['email']
      ..password = json['password']
      ..age = json['age']
      ..code = json['code'];
  }
  Map<String, dynamic> toJson() {
    return {
      'name': 'ThanhMinh',
      'email': email,
      'password': password,
      'age': 0,
      'code': code
    };
  }
}
