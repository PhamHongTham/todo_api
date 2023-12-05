import 'package:flutter/material.dart';
import 'package:todo_api/res/app_color.dart';

class PageIndex extends StatelessWidget {
  const PageIndex({
    super.key,
    required this.current,
    required this.itemCount,
  });

  final int current;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 15.0,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemCount,
          separatorBuilder: (context, index) => const SizedBox(width: 8.0),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: current == index
                    ? AppColor.h_FFFFFF.withOpacity(0.4)
                    : Colors.transparent,
              ),
              child: CircleAvatar(
                radius: 6.5,
                backgroundColor:
                    current == index ? AppColor.h_031956 : AppColor.h_FFFFFF,
              ),
            );
          },
        ),
      ),
    );
  }
}
