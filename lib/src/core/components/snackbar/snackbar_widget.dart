import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/src/core/utils/singleton_mixin.dart';
import 'package:sizer/sizer.dart';

import '../text/custom_text.dart';

class SnackbarWidget with SingletonMixin {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbarWidget(
      BuildContext context,
      {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomText(
          message,
          textAlign: TextAlign.start,
          textStyle: context.textTheme.headline2?.copyWith(
            fontSize: 12.sp,
            color: colors.wildSand,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 500),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        backgroundColor: colors.carnation,
      ),
    );
  }
}
