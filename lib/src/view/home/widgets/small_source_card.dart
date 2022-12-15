import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/app_constants.dart';

class SmallSourceCard extends StatelessWidget {
  const SmallSourceCard({
    Key? key,
    required this.source,
  }) : super(key: key);

  final String source;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
