import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:todo_api/constant/app_constant.dart';
import 'package:todo_api/service/remote/body/login_body.dart';
import 'package:todo_api/service/remote/body/otp_body.dart';
import 'package:todo_api/service/remote/body/register_body.dart';

abstract class ImpAuthenService {
  Future<http.Response> sendOTP(OTPBody otpBody);
  Future<http.Response> register(RegisterBody registerBody);
  Future<http.Response> login(LoginBody loginBody);
}

class AuthenService implements ImpAuthenService {
  @override
  Future<http.Response> sendOTP(OTPBody otpBody) async {
    const uri = AppConstant.endPointOtp;
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${null}',
      },
      body: jsonEncode(otpBody.toJson()),
    );
    return response;
  }

  @override
  Future<http.Response> register(RegisterBody registerBody) async {
    const uri = AppConstant.endPointAuthRegister;
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${null}',
      },
      body: jsonEncode(registerBody.toJson()),
    );
    return response;
  }

  @override
  Future<http.Response> login(LoginBody loginBody) async {
    const uri = AppConstant.endPointLogin;
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${null}',
      },
      body: jsonEncode(loginBody.toJson()),
    );
    return response;
  }
}
