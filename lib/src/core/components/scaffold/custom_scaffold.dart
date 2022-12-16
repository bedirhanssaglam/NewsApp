import 'package:flutter/material.dart';
import 'package:news_app/src/core/components/appbar/custom_app_bar.dart';
import 'package:sizer/sizer.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    super.key,
    this.isHomeView = false,
    required this.body,
    this.isTherePadding = true,
  });

  final bool? isHomeView;
  final Widget body;
  final bool? isTherePadding;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isHomeView: widget.isHomeView,
      ),
      body: widget.isTherePadding!
          ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: widget.body,
              ),
            )
          : widget.body,
    );
  }
}
