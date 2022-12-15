import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app/app_constants.dart';
import '../text/custom_text.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbarWidget(
    BuildContext context,
    {required String message,
    int milliseconds = 350,
    String? label,
    double? fontSize = 11}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: CustomText(
      message,
      textAlign: TextAlign.start,
      textStyle: context.textTheme.headline2?.copyWith(
        fontSize: 12.sp,
        color: AppConstants.instance.wildSand,
      ),
    ),
    action: SnackBarAction(
      label: label ?? "",
      onPressed: () {},
    ),
    behavior: SnackBarBehavior.floating,
    duration: Duration(milliseconds: milliseconds),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
    ),
    backgroundColor: AppConstants.instance.carnation,
  ));
}
