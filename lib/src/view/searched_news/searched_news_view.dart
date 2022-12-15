import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/base/bloc/news_bloc.dart';
import 'package:news_app/src/core/base/functions/base_functions.dart';
import 'package:news_app/src/core/base/services/news_service.dart';
import 'package:news_app/src/core/components/appbar/custom_app_bar.dart';
import 'package:news_app/src/core/init/network/vexana_manager.dart';
import 'package:sizer/sizer.dart';

import '../../core/base/models/articles_model.dart';
import '../details/details_view.dart';
import '../home/widgets/news_card.dart';

class SearchedNewsView extends StatefulWidget {
  const SearchedNewsView({
    super.key,
    required this.searchWord,
  });

  final String searchWord;

  @override
  State<SearchedNewsView> createState() => _SearchedNewsViewState();
}

class _SearchedNewsViewState extends State<SearchedNewsView> {
  late NewsBloc newsBloc;

  @override
  void initState() {
    super.initState();
    newsBloc = NewsBloc(NewsService(VexanaManager.instance.networkManager));
    newsBloc.add(FetchSearchedNews(widget.searchWord));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: BlocBuilder<NewsBloc, NewsState>(
            bloc: newsBloc,
            builder: (context, state) {
              if (state is FetchSearchedNewsLoading) {
                return platformIndicator();
              } else if (state is FetchSearchedNewsLoaded) {
                return ListView.builder(
                  itemCount: state.articles.length,
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
              } else if (state is FetchSearchedNewsError) {
                return errorText(state.errorMessage);
              } else {
                return errorText("Something went wrong!");
              }
            },
          ),
        ),
      ),
    );
  }
}
