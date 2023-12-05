import 'package:flutter/material.dart';
import 'package:todo_api/res/app_color.dart';
import 'package:todo_api/utils/utils.dart';

class SiderOnboarding extends StatelessWidget {
  const SiderOnboarding({
    super.key,
    this.backGround,
    this.image,
    this.onPageChanged,
    required this.current,
    required this.itemCount,
    this.controller,
  });

  final String? backGround;
  final String? image;
  final int current;
  final int itemCount;
  final PageController? controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: itemCount,
      onPageChanged: onPageChanged,
      controller: controller,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: Util.caculatorHeight(context, 582.0),
                    color: current == 0
                        ? AppColor.h_bgr1l
                        : current == 1
                            ? AppColor.h_bgr2l
                            : AppColor.h_bgr3l,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: Util.caculatorHeight(context, 582.0),
                    color: current == 0
                        ? AppColor.h_bgr1r
                        : current == 1
                            ? AppColor.h_bgr2r
                            : AppColor.h_bgr3r,
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                top: current == index
                    ? Util.caculatorHeight(context, 218.0)
                    : -200,
                right: current == index ? 45.0 : 300.0,
                left: current == index ? 45.0 : 300.0,
                child: Image.asset(image ?? ''))
          ],
        );
      },
    );
  }
}
