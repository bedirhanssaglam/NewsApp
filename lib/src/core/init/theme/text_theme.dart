import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app/app_constants.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight? get instance {
    _instance ??= TextThemeLight._init();
    return _instance;
  }

  TextThemeLight._init();

  final TextStyle headline1 = GoogleFonts.poppins(
    fontSize: 12.sp,
    color: AppConstants.instance.mineShaft,
    fontWeight: FontWeight.w500,
  );

  final TextStyle headline2 = GoogleFonts.poppins(
    fontSize: 14.sp,
    color: AppConstants.instance.mineShaft,
    fontWeight: FontWeight.w600,
  );

  final TextStyle headline3 = GoogleFonts.poppins(
      fontSize: 16.sp, color: AppConstants.instance.mineShaft);

  final TextStyle headline4 = GoogleFonts.poppins(
      fontSize: 19.sp, color: AppConstants.instance.mineShaft);

  final TextStyle headline5 = GoogleFonts.poppins(
      fontSize: 22.sp, color: AppConstants.instance.mineShaft);

  final TextStyle subtitle1 = GoogleFonts.poppins(
      fontSize: 18.sp, color: AppConstants.instance.mineShaft);

  final TextStyle subtitle2 = GoogleFonts.poppins(
      fontSize: 12.sp, color: AppConstants.instance.mineShaft);

  final TextStyle bodyText1 = GoogleFonts.poppins(
    fontSize: 9.sp,
    fontWeight: FontWeight.w500,
  );

  final TextStyle bodyText2 = GoogleFonts.poppins(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: AppConstants.instance.mineShaft,
  );

  final TextStyle button =
      GoogleFonts.inter(fontSize: 18.sp, color: Colors.white);
}
