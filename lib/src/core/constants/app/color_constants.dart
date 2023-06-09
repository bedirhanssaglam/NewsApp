import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instance;
  static ColorConstants get instance {
    _instance ??= ColorConstants._init();
    return _instance!;
  }

  ColorConstants._init();

  Color mineShaft = const Color(0xFF252525);
  Color bermuda = const Color(0xFF6EDBC9);
  Color wildSand = const Color(0xFFF6F6F6);
  Color carnation = const Color(0xFFFB5E5D);
}
