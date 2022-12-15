import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/core/components/animated_text/animated_text.dart';
import 'package:news_app/src/core/components/appbar/custom_app_bar.dart';
import 'package:news_app/src/core/components/sliding_switch/sliding_switch.dart';
import 'package:news_app/src/core/extensions/num_extensions.dart';
import 'package:news_app/src/view/home/turkey_news/turkey_news.dart';
import 'package:news_app/src/view/home/us_news/us_news.dart';
import 'package:news_app/src/view/sources/sources_view.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/enums/routes_enums.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isHomeView: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              2.h.ph,
              GestureDetector(
                onTap: () => context.go(RouteEnums.sources.routeName),
                child: AnimatedText(
                  "Follow the instant developments in Turkey and the US! Be the first to reach the news of different news sites! Tap to see all sources.",
                  textStyle: context.textTheme.headline1?.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SlidingSwitch(
                "Turkey News",
                "US News",
                page1: TurkeyNews(
                  country: "tr",
                ),
                page2: USNewsView(
                  country: "us",
                ),
                initialIndex: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
