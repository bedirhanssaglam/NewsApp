import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/src/core/extensions/num_extensions.dart';
import 'package:news_app/src/core/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';
import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/app_constants.dart';

class IntroHeader extends StatelessWidget {
  const IntroHeader({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        3.h.ph,
        Image.asset(
          image.toPng,
          height: 40.h,
        ),
        5.h.ph,
        CustomText(
          AppConstants.instance.appName,
          textStyle: context.textTheme.headline2,
        ),
        5.h.ph,
        CustomText(
          text,
          textStyle: context.textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
