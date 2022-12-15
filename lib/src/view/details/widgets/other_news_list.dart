import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/functions/base_functions.dart';
import '../../../core/init/network/vexana_manager.dart';
import '../../home/bloc/news_bloc.dart';
import '../../home/service/news_service.dart';
import 'other_news_widget.dart';

class OtherNewsList extends StatefulWidget {
  const OtherNewsList({
    Key? key,
  }) : super(key: key);

  @override
  State<OtherNewsList> createState() => _OtherNewsListState();
}

class _OtherNewsListState extends State<OtherNewsList> {
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
          return platformIndicator();
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
          return errorText(state.errorMessage);
        } else {
          return errorText("Something went wrong!");
        }
      },
    );
  }
}
