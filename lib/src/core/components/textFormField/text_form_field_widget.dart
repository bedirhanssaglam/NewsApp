// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app/app_constants.dart';
import '../../utils/typedefs.dart';
import '../text/custom_text.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final StringFunction onSaved;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;

  const TextFormFieldWidget({
    Key? key,
    this.hintText,
    this.onSaved,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.textEditingController,
    this.validator,
    this.onSubmitted,
    this.textInputAction,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      inputFormatters: inputFormatters,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: textInputType,
      autofocus: true,
      onFieldSubmitted: onSubmitted,
      textInputAction: textInputAction,
      style: context.textTheme.headline2?.copyWith(
        fontSize: 12.sp,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppConstants.instance.wildSand,
        hoverColor: AppConstants.instance.carnation,
        contentPadding: EdgeInsets.all(10.sp),
        hintStyle: context.textTheme.subtitle2?.copyWith(
          color: AppConstants.instance.mineShaft.withOpacity(.7),
          fontSize: 12.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppConstants.instance.carnation),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
      ),
      onSaved: (value) {
        onSaved != null ? onSaved!(value) : null;
      },
      validator: validator,
    );
  }
}
