import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.secondTextColor,
    this.textDecoration,
  }) : super(key: key);

  final String firstText;
  final String secondText;
  final Color secondTextColor;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: context.textTheme.headline2,
          ),
          TextSpan(
            text: secondText,
            style: context.textTheme.headline2?.copyWith(
              color: secondTextColor,
              decoration: textDecoration,
            ),
          ),
        ],
      ),
    );
  }
}
