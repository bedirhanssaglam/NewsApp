import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/src/core/extensions/num_extensions.dart';
import 'package:news_app/src/core/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/functions/base_functions.dart';
import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/constants/enums/icon_enums.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    this.imageUrl,
    required this.source,
    required this.author,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String? imageUrl;
  final String source;
  final String author;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppConstants.instance.wildSand,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          imageUrl != null || imageUrl != ""
              ? Image.network(
                  imageUrl!,
                  height: 16.h,
                  width: 30.w,
                  fit: BoxFit.cover,
                )
              : const SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.all(3.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    color: AppConstants.instance.bermuda,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: CustomText(
                      source,
                      textStyle: context.textTheme.bodyText1?.copyWith(
                        color: AppConstants.instance.wildSand,
                      ),
                    ),
                  ),
                ),
                CustomText(
                  toShortString(
                    "Author : $author",
                    countCharacter: 25,
                  ),
                ),
                CustomText(
                  toShortString(
                    title,
                    countCharacter: 24,
                  ),
                  textStyle: context.textTheme.headline1,
                ),
                2.h.ph,
                InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.w),
                    child: Row(
                      children: [
                        const CustomText("More..."),
                        SvgPicture.asset(
                          IconEnums.arrowForward.iconName.toSvg,
                          color: AppConstants.instance.mineShaft,
                          height: 20.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
