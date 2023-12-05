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
import 'package:todo_api/screens/home_screen/home_screen.dart';
import 'package:todo_api/screens/login_sign_in/register_screen.dart';
import 'package:todo_api/screens/login_sign_in/widgets/other_login.dart';
import 'package:todo_api/service/remote/authen_service.dart';
import 'package:todo_api/service/remote/body/login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.email});
  final String? email;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = widget.email ?? '';
  }

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
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                shrinkWrap: true,
                children: [
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
                    'Welcome Back!',
                    style: AppStyle.lexend_s28_w600_h_FFFFFF,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                  Text('Create your timing!',
                      style: AppStyle.lexend_s20_w400_h_FFFFFF,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 72.0),
                  Text('Email',
                      style: AppStyle.lexend_s20_w400_h_FFFFFF
                          .copyWith(fontSize: 18.0),
                      textAlign: TextAlign.start),
                  const SizedBox(height: 6.0),
                  InputFormField(
                    hintText: 'Enter your email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 26.0),
                  Text('Password',
                      style: AppStyle.lexend_s20_w400_h_FFFFFF
                          .copyWith(fontSize: 18.0),
                      textAlign: TextAlign.start),
                  const SizedBox(height: 6.0),
                  PasswordFormField(
                    hintText: 'Enter your password',
                    controller: passwordController,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Forgot Password?',
                    style: AppStyle.lexend_s16_w500_h_80BAFF,
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: 22.0),
                  AppButton(
                    label: 'TAKE ME IN',
                    onpressed: () {
                      AuthenService()
                          .login(LoginBody()
                            ..email = emailController.text.trim()
                            ..password = passwordController.text)
                          .then((response) {
                        final data = jsonDecode(response.body);
                        data['status_code'] == 200
                            ? Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                                (router) => false)
                            : showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Dang nhap khong thanh cong'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      )
                                    ],
                                  );
                                });
                        // if (data['status_code'] == 200) {
                        //   Navigator.of(context).pushAndRemoveUntil(
                        //       MaterialPageRoute(
                        //           builder: (context) => HomeScreen()),
                        //       (router) => false);
                        // } else {
                        //   showDialog(
                        //       context: context,
                        //       builder: (context) {
                        //         return AlertDialog(
                        //           title: Text('Dang nhap khong thanh cong'),
                        //           actions: [
                        //             TextButton(
                        //               onPressed: () {
                        //                 Navigator.of(context).pop();
                        //               },
                        //               child: Text('OK'),
                        //             )
                        //           ],
                        //         );
                        //       });
                        // }
                      });
                    },
                  ),
                  const SizedBox(height: 22.0),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don’t have an account?',
                          style: AppStyle.lexend_s16_w400_h_999494
                              .copyWith(color: AppColor.h_FFFFFF),
                        ),
                        const WidgetSpan(child: SizedBox(width: 12.0)),
                        TextSpan(
                          text: 'Register me',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
                            },
                          style: AppStyle.lexend_s16_w500_h_80BAFF,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 86.0),
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
            ))
          ],
        ),
      ),
    );
  }
}
