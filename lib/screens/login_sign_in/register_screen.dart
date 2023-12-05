// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:todo_api/components/buttons/app_button.dart';
import 'package:todo_api/components/text_form_field/input_form_field.dart';
import 'package:todo_api/components/text_form_field/password_form_field.dart';
import 'package:todo_api/gen/assets.gen.dart';
import 'package:todo_api/res/app_color.dart';
import 'package:todo_api/res/app_style.dart';
import 'package:todo_api/screens/login_sign_in/login_screen.dart';
import 'package:todo_api/screens/login_sign_in/verifycode_screen.dart';
import 'package:todo_api/screens/login_sign_in/widgets/other_login.dart';
import 'package:todo_api/service/remote/authen_service.dart';
import 'package:todo_api/service/remote/body/otp_body.dart';
import 'package:todo_api/service/remote/body/register_body.dart';
import 'package:todo_api/utils/utils.dart';
import 'package:todo_api/utils/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final globalKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.images.bgdesign.path,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Form(
                  key: globalKey,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    shrinkWrap: true,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            Assets.images.iconBack.path,
                            width: 24.0,
                            height: 24.0,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.images.logoSvg, width: 90.0),
                          const SizedBox(width: 14.0),
                          SvgPicture.asset(Assets.images.planitSvg, width: 99.0)
                        ],
                      ),
                      const SizedBox(height: 23.0),
                      Text(
                        'Let’s make an account!',
                        style: AppStyle.lexend_s28_w600_h_FFFFFF,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0),
                      Text('Create your timing!  ',
                          style: AppStyle.lexend_s20_w400_h_FFFFFF,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 33.0),
                      Text('Email',
                          style: AppStyle.lexend_s20_w400_h_FFFFFF
                              .copyWith(fontSize: 18.0),
                          textAlign: TextAlign.start),
                      const SizedBox(height: 6.0),
                      InputFormField(
                        controller: emailController,
                        hintText: 'Enter your email',
                        validator: (value) => Validator.checkEmail(value),
                      ),
                      const SizedBox(height: 26.0),
                      Text('Password',
                          style: AppStyle.lexend_s20_w400_h_FFFFFF
                              .copyWith(fontSize: 18.0),
                          textAlign: TextAlign.start),
                      const SizedBox(height: 6.0),
                      PasswordFormField(
                        controller: passwordController,
                        hintText: 'Enter your password',
                        validator: (value) => Validator.checkPassword(value),
                      ),
                      const SizedBox(height: 26.0),
                      Text('Confirm password',
                          style: AppStyle.lexend_s20_w400_h_FFFFFF
                              .copyWith(fontSize: 18.0),
                          textAlign: TextAlign.start),
                      const SizedBox(height: 6.0),
                      PasswordFormField(
                          controller: passwordConfirmController,
                          hintText: 'Re-Enter your password',
                          validator: (value) => Validator.checkCconfirmPassword(
                              value, passwordController.text)),
                      const SizedBox(height: 40.0),
                      AppButton(
                          label: 'SEND CODE',
                          onpressed: () {
                            if (globalKey.currentState!.validate()) {
                              final OTPBody otpBody = OTPBody()
                                ..email = emailController.text.trim();
                              AuthenService().sendOTP(otpBody).then((response) {
                                final data = jsonDecode(response.body);
                                if (data['status_code'] == 200) {
                                  print('otp ${data['body']['code']}');
                                } else {
                                  print('otp ${data['message']}');
                                }
                              });
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => VerifyCodeScreen(
                                    registerBody: RegisterBody()
                                      ..email = emailController.text.trim()
                                      ..password = passwordController.text,
                                  ),
                                ),
                              );
                            }
                          }),
                      const SizedBox(height: 22.0),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already a member?',
                              style: AppStyle.lexend_s16_w400_h_999494
                                  .copyWith(color: AppColor.h_FFFFFF),
                            ),
                            const WidgetSpan(child: SizedBox(width: 12.0)),
                            TextSpan(
                              text: 'Log In',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                                },
                              style: AppStyle.lexend_s16_w500_h_80BAFF,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 26.0),
                      Row(
                        children: [
                          const Expanded(child: Divider(endIndent: 23.0)),
                          Text(
                            'OR',
                            style: AppStyle.lexend_s16_w400_h_999494
                                .copyWith(color: AppColor.h_FFFFFF),
                          ),
                          const Expanded(child: Divider(indent: 23.0))
                        ],
                      ),
                      const SizedBox(height: 50.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OtherLogin(
                            image: Assets.images.googlelogo.path,
                            label: 'Google',
                          ),
                          const SizedBox(width: 55.0),
                          OtherLogin(
                            image: Assets.images.facebooklogo.path,
                            label: 'Facebook',
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
