// ignore_for_file: public_member_api_docs, sort_constructors_first
class OTPBody {
  String? email;
  OTPBody();
  factory OTPBody.fromJson(Map<String, dynamic> json) {
    return OTPBody()..email = json['email'];
  }
  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}
