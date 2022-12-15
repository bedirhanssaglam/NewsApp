import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/view/details/details_view.dart';
import 'package:sizer/sizer.dart';

import 'package:news_app/src/core/base/functions/base_functions.dart';
import 'package:news_app/src/core/init/network/vexana_manager.dart';
import 'package:news_app/src/view/home/bloc/news_bloc.dart';

import '../../../core/base/models/articles_model.dart';
import '../service/news_service.dart';
import '../widgets/news_card.dart';

class TurkeyNews extends StatefulWidget {
  const TurkeyNews({
    super.key,
    required this.country,
  });

  final String country;

  @override
  State<TurkeyNews> createState() => _TurkeyNewsState();
}

class _TurkeyNewsState extends State<TurkeyNews> {
  late NewsBloc newsBloc;

  @override
  void initState() {
    super.initState();
    newsBloc = NewsBloc(NewsService(VexanaManager.instance.networkManager));
    newsBloc.add(FetchNewsByCountry(widget.country));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: newsBloc,
      builder: (context, state) {
        if (state is FetchNewsByCountryLoading) {
          return platformIndicator();
        } else if (state is FetchNewsByCountryLoaded) {
          return ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              ArticlesModel item = state.articles[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: NewsCard(
                  imageUrl: item.urlToImage,
                  source: item.source?.name ?? "",
                  author: item.author ?? "",
                  title: item.title ?? "",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsView(
                          description: item.description ?? "",
                          imageUrl: item.urlToImage ?? "",
                          sourceName: item.source?.name ?? "",
                          author: item.author ?? "",
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        } else if (state is FetchNewsByCountryError) {
          return errorText(state.errorMessage);
        } else {
          return errorText("Bir şeyler ters gitti!");
        }
      },
    );
  }
}
