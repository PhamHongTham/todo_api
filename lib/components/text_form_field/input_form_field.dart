import 'package:flutter/material.dart';
import 'package:todo_api/res/app_color.dart';
import 'package:todo_api/res/app_style.dart';

class InputFormField extends StatelessWidget {
  const InputFormField({
    super.key,
    this.hintText,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.controller,
  });
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:
          AppStyle.lexend_s16_w400_h_999494.copyWith(color: AppColor.h_000000),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        hintText: hintText,
        hintStyle: AppStyle.lexend_s16_w400_h_999494,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.13),
        filled: true,
        fillColor: AppColor.h_FFFFFF,
      ),
    );
  }
}
