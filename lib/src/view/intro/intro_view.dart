import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/src/core/constants/enums/icon_enums.dart';
import 'package:news_app/src/core/constants/enums/routes_enums.dart';
import 'package:news_app/src/core/extensions/num_extensions.dart';
import 'package:news_app/src/core/extensions/string_extensions.dart';
import 'package:news_app/src/core/utils/singleton_mixin.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../core/components/text/custom_text.dart';
import '../../core/constants/app/app_constants.dart';
import 'provider/current_page_provider.dart';
import 'widgets/intro_header.dart';

class IntroView extends StatelessWidget with SingletonMixin {
  IntroView({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              1.h.ph,
              Expanded(
                flex: 8,
                child: Consumer<CurrentPageProvider>(
                  builder: (context, value, child) {
                    return PageView.builder(
                      controller: pageController,
                      onPageChanged: (value) {
                        context
                            .read<CurrentPageProvider>()
                            .setCurrentPage(value);
                      },
                      itemCount: AppConstants.instance.splashData.length,
                      itemBuilder: (context, index) => IntroHeader(
                        image: AppConstants.instance.splashData[index]
                            ["image"]!,
                        text: AppConstants.instance.splashData[index]['text']!,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    40.w.pw,
                    Consumer<CurrentPageProvider>(
                      builder: (context, value, child) {
                        return Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                AppConstants.instance.splashData.length,
                                (index) {
                                  return buildPageDots(context, index);
                                },
                              ),
                            ),
                            22.w.pw,
                            InkWell(
                              onTap: () =>
                                  context.go(RouteEnums.home.routeName),
                              child: Row(
                                children: [
                                  CustomText(
                                    "Skip",
                                    textStyle:
                                        context.textTheme.headline1?.copyWith(
                                      color: colors.carnation,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    IconEnums.arrowForward.iconName.toSvg,
                                    height: 18.sp,
                                    color: colors.carnation,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildPageDots(BuildContext context, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 1.w),
      height: 1.5.w,
      width: context.watch<CurrentPageProvider>().currentPage == index
          ? 6.w
          : 2.5.w,
      decoration: BoxDecoration(
        color: context.watch<CurrentPageProvider>().currentPage == index
            ? colors.carnation
            : colors.mineShaft,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
