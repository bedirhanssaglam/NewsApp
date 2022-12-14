import 'package:flutter/material.dart';
import 'package:news_app/src/core/components/appbar/custom_app_bar.dart';
import 'package:news_app/src/core/components/sliding_switch/sliding_switch.dart';
import 'package:news_app/src/view/home/turkey_news/turkey_news.dart';
import 'package:news_app/src/view/home/us_news/us_news.dart';
import 'package:sizer/sizer.dart';

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
            children: const [
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
