import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/core/components/textFormField/text_form_field_widget.dart';
import 'package:news_app/src/core/constants/enums/icon_enums.dart';
import 'package:news_app/src/core/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../utils/singleton_mixin.dart';
import '../snackbar/snackbar_widget.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    this.isHomeView = false,
    this.onTap,
    this.navigatorState,
  }) : super(key: key);

  final bool? isHomeView;
  final VoidCallback? onTap;
  bool isOpenSearch = false;

  late String searchWord;
  final _formKey = GlobalKey<FormState>();
  final GoRouterState? navigatorState;

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingletonMixin, TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  Widget build(BuildContext context) {
    return !widget.isOpenSearch
        ? AppBar(
            automaticallyImplyLeading: false,
            leading: widget.isHomeView!
                ? IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(IconEnums.menu.iconName.toSvg),
                  )
                : functions.platformBackButton(
                    onPressed: widget.onTap ?? () {},
                  ),
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Image.asset(
              IconEnums.appbar.iconName.toPng,
              height: 6.h,
            ),
            elevation: 2,
            actions: [
              IconButton(
                  icon: SvgPicture.asset(IconEnums.search.iconName.toSvg),
                  onPressed: () {
                    setState(() {
                      widget.isOpenSearch = !widget.isOpenSearch;
                    });
                  })
            ],
          )
        : AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              IconButton(
                  icon: SvgPicture.asset('search'.toSvg),
                  onPressed: () {
                    _searchWord(context);
                  }),
            ],
            title: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Form(
                key: widget._formKey,
                child: SizeTransition(
                  sizeFactor: _animation,
                  axis: Axis.horizontal,
                  axisAlignment: -1,
                  child: TextFormFieldWidget(
                    onSaved: (value) {
                      widget.searchWord = value ?? "";
                    },
                    onSubmitted: (value) {
                      _searchWord(context);
                    },
                    hintText: "Search...",
                    textInputAction: TextInputAction.search,
                    suffixIcon: widget.isOpenSearch
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.isOpenSearch = !widget.isOpenSearch;
                                });
                              },
                              child: Icon(
                                Icons.close,
                                size: 30,
                                color: colors.mineShaft,
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(6.sp),
                            child: Icon(
                              Icons.search,
                              size: 15.sp,
                              color: colors.mineShaft,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          );
  }

  void _searchWord(BuildContext context) {
    setState(() {
      widget.isOpenSearch = !widget.isOpenSearch;
      widget._formKey.currentState?.save();
      if (widget.searchWord.isEmpty) {
        SnackbarWidget().snackbarWidget(
          context,
          message: "Type the word you want to search for.",
        );
      } else {
        context.go("/searched-news/${widget.searchWord}");
      }
    });
  }
}
