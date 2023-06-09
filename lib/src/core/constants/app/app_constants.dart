import 'package:news_app/src/core/constants/enums/icon_enums.dart';

class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._init();
    return _instance!;
  }

  AppConstants._init();

  final String appName = "The News";
  final String apiKey = "[ENTER_YOUR_API_KEY]";
  final String noImage =
      "https://images.unsplash.com/photo-1547721064-da6cfb341d50";
  final String promotionalTitle =
      "Follow the instant developments in Turkey and the US! Be the first to reach the news of different news sites! Tap to see all sources.";
  final String errorMessage = "Something went wrong!";
  final String unknown = "Unknown";
  final String turkeyNews = "Turkey News";
  final String usNews = "US News";
  final String searchedText = "News about the";

  final List<Map<String, String>> splashData = [
    {
      "text":
          "A comprehensive news application that brings together all the news you need to know in Turkey and the US during the day.",
      "image": IconEnums.introFirst.iconName,
    },
    {
      "text":
          "Thanks to The News, which brings together the prominent topics of the agenda and last-minute developments, as well as many resources for different interests, everything you should not miss is at your fingertips.",
      "image": IconEnums.introSecond.iconName,
    },
    {
      "text":
          "Come every day and check out all the news that might interest you! So let's start!",
      "image": IconEnums.introThird.iconName,
    },
  ];
}
