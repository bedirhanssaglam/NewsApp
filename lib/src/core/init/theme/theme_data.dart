import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app/color_constants.dart';
import 'app_theme.dart';
import 'i_text_theme.dart';

class AppThemeLight extends AppTheme with ITheme {
  static AppThemeLight? _instance;

  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
        textTheme: GoogleFonts.interTextTheme().copyWith(
          headline1: textThemeLight!.headline1,
          headline2: textThemeLight!.headline2,
          headline3: textThemeLight!.headline3,
          headline4: textThemeLight!.headline4,
          headline5: textThemeLight!.headline5,
          bodyText1: textThemeLight!.bodyText1,
          bodyText2: textThemeLight!.bodyText2,
          subtitle1: textThemeLight!.subtitle1,
          subtitle2: textThemeLight!.subtitle2,
          button: textThemeLight!.button,
        ),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: ColorConstants.instance.mineShaft,
            ),
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
                color: ColorConstants.instance.mineShaft, size: 21),
            systemOverlayStyle: SystemUiOverlayStyle.dark),
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
      );
}
