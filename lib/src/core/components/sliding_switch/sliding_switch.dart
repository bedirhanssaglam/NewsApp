import 'package:flutter/material.dart';
import 'package:news_app/src/core/utils/singleton_mixin.dart';
import 'package:news_app/src/core/utils/typedefs.dart';
import 'package:sizer/sizer.dart';

import '../text/custom_text.dart';

class SlidingSwitch extends StatefulWidget {
  final String page1Title;
  final String page2Title;
  final Widget? page1;
  final Widget? page2;
  final double? height;
  final IndexFunction onSwitch;
  final int initialIndex;

  const SlidingSwitch(
    this.page1Title,
    this.page2Title, {
    Key? key,
    this.page1,
    this.page2,
    this.height,
    this.onSwitch,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<SlidingSwitch> createState() => _SlidingSwitchState();
}

class _SlidingSwitchState extends State<SlidingSwitch> with SingletonMixin {
  int? _selectedIndex;

  int get selectedIndex => _selectedIndex ?? 0;

  set selectedIndex(int selectedIndex) {
    if (selectedIndex != _selectedIndex) {
      setState(() {
        _selectedIndex = selectedIndex;
        widget.onSwitch?.call(selectedIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTabSelector(),
          selectedIndex == 0
              ? widget.page1 ?? const SizedBox.shrink()
              : widget.page2 ?? const SizedBox.shrink()
        ],
      ),
    );
  }

  Container buildTabSelector() {
    return Container(
      height: widget.height ?? 7.h,
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colors.wildSand,
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: selectedIndex == 0
                ? Alignment.centerLeft
                : Alignment.centerRight,
            duration: const Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors.carnation,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      selectedIndex = 0;
                    },
                    child: CustomText(
                      widget.page1Title,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: selectedIndex == 0
                            ? Colors.white
                            : colors.mineShaft,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      selectedIndex = 1;
                    },
                    child: CustomText(
                      widget.page2Title,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: selectedIndex == 1
                            ? Colors.white
                            : colors.mineShaft,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
