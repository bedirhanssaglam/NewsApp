import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/src/core/utils/singleton_mixin.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/text/custom_text.dart';

class SmallSourceCard extends StatelessWidget with SingletonMixin {
  const SmallSourceCard({
    Key? key,
    required this.source,
  }) : super(key: key);

  final String source;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      width: 30.w,
      decoration: BoxDecoration(
        color: colors.bermuda,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: CustomText(
          source,
          textStyle: context.textTheme.bodyText1?.copyWith(
            color: colors.wildSand,
          ),
        ),
      ),
    );
  }
}
