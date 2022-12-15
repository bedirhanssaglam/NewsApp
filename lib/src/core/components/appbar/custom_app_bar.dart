import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/core/components/textFormField/text_form_field_widget.dart';
import 'package:news_app/src/core/constants/enums/icon_enums.dart';
import 'package:news_app/src/core/extensions/string_extensions.dart';
import 'package:news_app/src/view/searched_news/searched_news_view.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app/app_constants.dart';
import '../snackbar/snackbar_widget.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    this.isHomeView = false,
    this.navigatorState,
  }) : super(key: key);

  final bool? isHomeView;
  bool isOpenSearch = false;

  late String searchWord;
  final _formKey = GlobalKey<FormState>();
  final GoRouterState? navigatorState;

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with TickerProviderStateMixin {
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
            centerTitle: true,
            shadowColor: Colors.grey.shade200,
            backgroundColor: Colors.white,
            title: Image.asset(
              IconEnums.appbar.iconName.toPng,
              height: 6.h,
            ),
            elevation: 3,
            actions: [
              IconButton(
                  icon: SvgPicture.asset('search'.toSvg),
                  onPressed: () {
                    setState(() {
                      widget.isOpenSearch = !widget.isOpenSearch;
                    });
                  })
            ],
          )
        : AppBar(
            centerTitle: true,
            actions: [
              IconButton(
                  icon: SvgPicture.asset('search'.toSvg),
                  onPressed: () {
                    _searchWord(context);
                  }),
            ],
            title: Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
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
                                color: AppConstants.instance.mineShaft,
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(6.sp),
                            child: Icon(
                              Icons.search,
                              size: 15.sp,
                              color: AppConstants.instance.mineShaft,
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
        snackbarWidget(
          context,
          message: "Type the word you want to search for.",
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SearchedNewsView(
              searchWord: widget.searchWord,
            ),
          ),
        );
      }
    });
  }
}
