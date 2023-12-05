// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_api/res/app_color.dart';
import 'package:todo_api/res/app_style.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    Key? key,
    this.hintText,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.controller,
  }) : super(key: key);
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _idHiden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _idHiden,
      style:
          AppStyle.lexend_s16_w400_h_999494.copyWith(color: AppColor.h_000000),
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _idHiden = !_idHiden;
            });
          },
          child: Icon(
            _idHiden
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 22.0,
            color: AppColor.h_456ADD,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        hintText: widget.hintText,
        hintStyle: AppStyle.lexend_s16_w400_h_999494,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.13),
        filled: true,
        fillColor: AppColor.h_FFFFFF,
      ),
    );
  }
}
