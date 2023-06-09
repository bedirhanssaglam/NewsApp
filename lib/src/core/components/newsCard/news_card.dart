import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/src/core/extensions/num_extensions.dart';
import 'package:news_app/src/core/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../utils/singleton_mixin.dart';
import '../text/custom_text.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/enums/icon_enums.dart';
import '../../../view/home/widgets/small_source_card.dart';

/// Since this widget is used on almost all pages,
/// it is defined in the [components] in the [core] layer.

class NewsCard extends StatelessWidget with SingletonMixin {
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
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 16.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.wildSand,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Image.network(
              imageUrl ?? AppConstants.instance.noImage,
              height: 16.h,
              width: 30.w,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(3.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallSourceCard(source: source),
                  CustomText(
                    functions.toShortString(
                      "Author : $author",
                      countCharacter: 25,
                    ),
                  ),
                  CustomText(
                    functions.toShortString(
                      title,
                      countCharacter: 24,
                    ),
                    textStyle: context.textTheme.headline1,
                  ),
                  2.h.ph,
                  Padding(
                    padding: EdgeInsets.only(left: 40.w),
                    child: Row(
                      children: [
                        const CustomText("More..."),
                        SvgPicture.asset(
                          IconEnums.arrowForward.iconName.toSvg,
                          color: colors.mineShaft,
                          height: 20.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
