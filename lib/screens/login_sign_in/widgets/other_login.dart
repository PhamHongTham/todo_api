import 'package:flutter/material.dart';
import 'package:todo_api/res/app_color.dart';
import 'package:todo_api/res/app_style.dart';

class OtherLogin extends StatelessWidget {
  const OtherLogin({
    super.key,
    this.image,
    this.label,
  });
  final String? image;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image ?? '',
          width: 50.0,
        ),
        const SizedBox(width: 12.0),
        Text(
          label ?? '',
          style: AppStyle.lexend_s16_w400_h_999494
              .copyWith(color: AppColor.h_FFFFFF),
        )
      ],
    );
  }
}
