import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/utils/singleton_mixin.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/bloc/news_bloc.dart';
import '../../../core/init/network/vexana_manager.dart';
import '../../../core/base/services/news_service.dart';
import 'other_news_widget.dart';

class OtherNewsList extends StatefulWidget {
  const OtherNewsList({
    Key? key,
  }) : super(key: key);

  @override
  State<OtherNewsList> createState() => _OtherNewsListState();
}

class _OtherNewsListState extends State<OtherNewsList> with SingletonMixin {
  late NewsBloc newsBloc;

  @override
  void initState() {
    super.initState();
    newsBloc = NewsBloc(NewsService(VexanaManager.instance.networkManager));
    newsBloc.add(const FetchNewsByCountry("tr"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: newsBloc,
      builder: (context, state) {
        if (state is FetchNewsByCountryLoading) {
          return functions.platformIndicator();
        } else if (state is FetchNewsByCountryLoaded) {
          return SizedBox(
            height: 25.h,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                var item = state.articles[index];
                return OtherNewsWidget(item: item);
              },
            ),
          );
        } else if (state is FetchNewsByCountryError) {
          return functions.errorText(state.errorMessage);
        } else {
          return functions.errorText("Something went wrong!");
        }
      },
    );
  }
}
