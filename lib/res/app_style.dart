// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_api/res/app_color.dart';

class AppStyle {
  AppStyle._();
  static TextStyle s16_w400_w = GoogleFonts.patuaOne(
    textStyle: const TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: AppColor.h_FFFFFF),
  );
  static TextStyle lexend_s28_w600_h_FFFFFF = GoogleFonts.lexend(
    fontSize: 28.0,
    color: AppColor.h_FFFFFF,
    fontWeight: FontWeight.w600,
  );
  static TextStyle lexend_s20_w400_h_FFFFFF = GoogleFonts.lexend(
    fontSize: 20.0,
    color: AppColor.h_FFFFFF,
    fontWeight: FontWeight.w400,
  );
  static TextStyle lexend_s16_w400_h_999494 = GoogleFonts.lexend(
    fontSize: 16.0,
    color: AppColor.h_999494,
    fontWeight: FontWeight.w400,
  );
  static TextStyle lexend_s16_w500_h_80BAFF = GoogleFonts.lexend(
    fontSize: 16.0,
    color: AppColor.h_80BAFF,
    fontWeight: FontWeight.w600,
  );
  static TextStyle lexend_s19_w400_h_EEF3FA = GoogleFonts.lexend(
    fontSize: 19.0,
    color: AppColor.h_EEF3FA,
    fontWeight: FontWeight.w400,
  );
}
