import 'package:flutter/material.dart';

class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._init();
    return _instance!;
  }

  AppConstants._init();

  String appName = "The News";

  Color mineShaft = const Color(0xFF333333);
  Color carnation = const Color(0xFFFB5E5D);
}
