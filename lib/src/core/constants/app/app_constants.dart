import 'package:flutter/material.dart';

class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._init();
    return _instance!;
  }

  AppConstants._init();

  String appName = "The News";
  String apiKey = "[API_KEY]";

  Color mineShaft = const Color(0xFF252525);
  Color bermuda = const Color(0xFF6EDBC9);
  Color wildSand = const Color(0xFFF6F6F6);
  Color carnation = const Color(0xFFFB5E5D);
}
