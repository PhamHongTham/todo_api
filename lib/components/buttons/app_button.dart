import 'package:flutter/material.dart';
import 'package:todo_api/res/app_color.dart';
import 'package:todo_api/res/app_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.label, this.onpressed,
  });
  final String? label;
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColor.h_031956,
        ),
        child: Text(
          label ?? '',
          style: AppStyle.lexend_s19_w400_h_EEF3FA,
        ),
      ),
    );
  }
}
