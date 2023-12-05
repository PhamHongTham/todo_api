import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:todo_api/components/buttons/app_button.dart';
import 'package:todo_api/gen/assets.gen.dart';
import 'package:todo_api/res/app_color.dart';
import 'package:todo_api/res/app_style.dart';
import 'package:todo_api/screens/login_sign_in/login_screen.dart';
import 'package:todo_api/screens/login_sign_in/widgets/pin_code.dart';
import 'package:todo_api/service/remote/authen_service.dart';
import 'package:todo_api/service/remote/body/register_body.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key, required this.registerBody});
  final RegisterBody registerBody;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController codeController = TextEditingController();
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0)
                    .copyWith(top: MediaQuery.of(context).padding.top),
                child: Column(
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
                      'Verify Email',
                      style: AppStyle.lexend_s28_w600_h_FFFFFF,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    Text('Code is sent to your email.',
                        style: AppStyle.lexend_s20_w400_h_FFFFFF,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 54.0),
                    PinCode(
                      controller: codeController,
                    ),
                    const SizedBox(height: 54.0),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'You didn’t receive code?',
                            style: AppStyle.lexend_s16_w400_h_999494
                                .copyWith(color: AppColor.h_FFFFFF),
                          ),
                          const WidgetSpan(child: SizedBox(width: 12.0)),
                          TextSpan(
                            text: 'Re-send',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                              },
                            style: AppStyle.lexend_s16_w500_h_80BAFF,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36.0),
                    AppButton(
                        label: 'VERIFY ME',
                        onpressed: () {
                          AuthenService()
                              .register(widget.registerBody
                                ..code = codeController.text)
                              .then(
                            (response) {
                              final data = jsonDecode(response.body);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(data['status_code'] == 200
                                          ? 'Dang nhap thanh cong'
                                          : data['message'] == "USER_EXISTED"
                                              ? 'Email da ton tai'
                                              : 'Sai OTP'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            data['status_code'] == 200
                                                ? Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    LoginScreen(
                                                                      email: widget
                                                                          .registerBody
                                                                          .email,
                                                                    )),
                                                        (router) => false)
                                                : Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        )
                                      ],
                                    );
                                  });
                              // if (data['status_code'] == 200) {
                              //   // print('user đăng ký thành công: ${data['body']}');
                              //   showDialog(
                              //       context: context,
                              //       builder: (context) {
                              //         return AlertDialog(
                              //           title: Text('Dang ky thanh cong'),
                              //           actions: [
                              //             TextButton(
                              //               onPressed: () {
                              //                 Navigator.of(context)
                              //                     .pushAndRemoveUntil(
                              //                         MaterialPageRoute(
                              //                             builder: (context) =>
                              //                                 LoginScreen()),
                              //                         (router) => false);
                              //               },
                              //               child: Text('OK'),
                              //             )
                              //           ],
                              //         );
                              //       });
                              // } else {
                              //   showDialog(
                              //       context: context,
                              //       builder: (context) {
                              //         return AlertDialog(
                              //           title: Text(
                              //               data['message'] == "USER_EXISTED"
                              //                   ? 'Email da ton tai'
                              //                   : 'Sai OTP'),
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
                            },
                          );
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
