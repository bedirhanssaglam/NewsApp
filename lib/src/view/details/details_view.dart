import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import 'package:news_app/src/core/components/appbar/custom_app_bar.dart';
import 'package:news_app/src/core/components/text/custom_text.dart';
import 'package:news_app/src/core/extensions/num_extensions.dart';
import 'package:news_app/src/view/home/widgets/small_source_card.dart';

import '../../core/base/functions/base_functions.dart';
import 'widgets/other_news_list.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    Key? key,
    required this.description,
    required this.imageUrl,
    required this.sourceName,
    required this.author,
  }) : super(key: key);

  final String description;
  final String imageUrl;
  final String sourceName;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () => GoRouter.of(context).pop(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            1.h.ph,
            Image.network(
              imageUrl,
              height: 25.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            2.h.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallSourceCard(source: sourceName),
                      CustomText(
                        toShortString(
                          "Author : $author",
                          countCharacter: 25,
                        ),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  3.h.ph,
                  CustomText(
                    description,
                    textStyle: context.textTheme.headline1,
                  ),
                  3.h.ph,
                  CustomText(
                    "Other News",
                    textStyle: context.textTheme.headline2,
                  ),
                  2.h.ph,
                  const OtherNewsList(),
                  2.h.ph,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
