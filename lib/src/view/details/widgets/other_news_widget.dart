import 'package:flutter/material.dart';
import 'package:news_app/src/core/components/text/custom_text.dart';
import 'package:news_app/src/core/constants/app/app_constants.dart';
import 'package:news_app/src/core/utils/singleton_mixin.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/models/articles_model.dart';

class OtherNewsWidget extends StatelessWidget with SingletonMixin {
  const OtherNewsWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ArticlesModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.w),
      child: Container(
        height: 25.h,
        width: 25.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Image.network(
              item.urlToImage ?? AppConstants.instance.noImage,
              height: 15.h,
              fit: BoxFit.fill,
            ),
            CustomText(
              functions.toShortString(
                item.description ?? "",
                countCharacter: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
