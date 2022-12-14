import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/src/core/extensions/num_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/functions/base_functions.dart';
import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/app_constants.dart';

class SourceCard extends StatelessWidget {
  const SourceCard({
    Key? key,
    required this.onTap,
    required this.name,
    required this.description,
  }) : super(key: key);

  final VoidCallback onTap;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 25.h,
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: AppConstants.instance.bermuda.withOpacity(.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomText(
                name,
                textStyle: context.textTheme.headline1,
              ),
              1.h.ph,
              CustomText(
                toShortString(
                  description,
                  countCharacter: 115,
                ),
                textStyle: context.textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
