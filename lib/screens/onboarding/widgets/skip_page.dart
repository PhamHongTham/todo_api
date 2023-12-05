import 'package:flutter/material.dart';
import 'package:todo_api/gen/assets.gen.dart';
import 'package:todo_api/res/app_style.dart';

class SkipPage extends StatelessWidget {
  const SkipPage({
    super.key,
    this.iconSize,
    this.fontSize,
    this.label, this.onTap,
  });
  final double? iconSize;
  final double? fontSize;
  final String? label;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(label ?? '',
              style: AppStyle.s16_w400_w.copyWith(fontSize: fontSize)),
          const SizedBox(width: 12.0),
          Image.asset(Assets.images.iconNext.path, width: iconSize),
        ],
      ),
    );
  }
}
