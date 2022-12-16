import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/core/components/animated_text/animated_text.dart';
import 'package:news_app/src/core/components/scaffold/custom_scaffold.dart';
import 'package:news_app/src/core/components/sliding_switch/sliding_switch.dart';
import 'package:news_app/src/core/constants/app/app_constants.dart';
import 'package:news_app/src/core/extensions/num_extensions.dart';
import 'package:news_app/src/view/home/turkey_news/turkey_news.dart';
import 'package:news_app/src/view/home/us_news/us_news.dart';
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
    return CustomScaffold(
      isHomeView: true,
      body: Column(
        children: [
          2.h.ph,
          GestureDetector(
            onTap: () => context.go(RouteEnums.sources.routeName),
            child: AnimatedText(
              AppConstants.instance.promotionalTitle,
              textStyle: context.textTheme.headline1?.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SlidingSwitch(
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
    );
  }
}
