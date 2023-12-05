import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:todo_api/res/app_color.dart';
import 'package:todo_api/res/app_style.dart';

class PinCode extends StatelessWidget {
  const PinCode({
    super.key,
    this.onChanged,
    this.onCompleted,
    this.controller,
  });
  final Function(String)? onChanged;
  final Function(String)? onCompleted;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      textStyle: AppStyle.lexend_s16_w500_h_80BAFF
          .copyWith(color: AppColor.h_456ADD, fontSize: 36.0),
      pastedTextStyle: AppStyle.lexend_s16_w500_h_80BAFF
          .copyWith(color: AppColor.h_456ADD, fontSize: 36.0),
      animationType: AnimationType.scale, // hiệu ứng nhập văn bản
      enableActiveFill: true,
      useHapticFeedback: true, // phản hoòi rung
      appContext: context,
      cursorColor: AppColor.h_031956, //màu con trỏ
      cursorWidth: 2.0, //
      cursorHeight: 28.0,
      controller: controller,
      enablePinAutofill: true, // cho phép tự động điền mã
      length: 4, // Độ dài mã xác nhận
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      onCompleted: onCompleted,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12.0),
        fieldHeight: 52,
        fieldWidth: 52,
        activeFillColor: AppColor.h_FFFFFF,
        activeColor: AppColor.h_FFFFFF,
        selectedColor: AppColor.h_FFFFFF,
        selectedFillColor: AppColor.h_FFFFFF,
        inactiveColor: AppColor.h_FFFFFF,
        inactiveFillColor: AppColor.h_FFFFFF,
      ),
    );
  }
}
