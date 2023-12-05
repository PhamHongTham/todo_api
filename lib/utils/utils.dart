import 'package:flutter/material.dart';

class Util {
  static double caculatorWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value / 430;
  }

  static double caculatorHeight(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value / 932;
  }
}
