import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/core/base/bloc/news_bloc.dart';
import 'package:news_app/src/core/base/services/news_service.dart';
import 'package:news_app/src/core/components/appbar/custom_app_bar.dart';
import 'package:news_app/src/core/components/richText/custom_rich_text.dart';
import 'package:news_app/src/core/constants/app/app_constants.dart';
import 'package:news_app/src/core/constants/enums/routes_enums.dart';
import 'package:news_app/src/core/extensions/num_extensions.dart';
import 'package:news_app/src/core/utils/singleton_mixin.dart';
import 'package:sizer/sizer.dart';

import '../../core/base/models/articles_model.dart';
import '../details/details_view.dart';
import '../../core/components/newsCard/news_card.dart';

class SearchedNewsView extends StatefulWidget {
  const SearchedNewsView({
    super.key,
    required this.searchWord,
  });

  final String searchWord;

  @override
  State<SearchedNewsView> createState() => _SearchedNewsViewState();
}

class _SearchedNewsViewState extends State<SearchedNewsView>
    with SingletonMixin {
  late NewsBloc newsBloc;

  @override
  void initState() {
    super.initState();
    newsBloc = NewsBloc(NewsService(vexanaManager.networkManager));
    newsBloc.add(FetchSearchedNews(widget.searchWord));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () => context.go(RouteEnums.home.routeName),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              3.h.ph,
              CustomRichText(
                firstText: constants.searchedText,
                secondText: widget.searchWord,
                secondTextColor: colors.carnation,
              ),
              2.h.ph,
              BlocBuilder<NewsBloc, NewsState>(
                bloc: newsBloc,
                builder: (context, state) {
                  if (state is FetchSearchedNewsLoading) {
                    return functions.platformIndicator();
                  } else if (state is FetchSearchedNewsLoaded) {
                    return _buildNewsList(state);
                  } else if (state is FetchSearchedNewsError) {
                    return functions.errorText(state.errorMessage);
                  } else {
                    return functions.errorText(constants.errorMessage);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView _buildNewsList(FetchSearchedNewsLoaded state) {
    return ListView.builder(
      itemCount: state.articles.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        ArticlesModel item = state.articles[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: NewsCard(
            imageUrl: item.urlToImage ?? AppConstants.instance.noImage,
            source: item.source?.name ?? "",
            author: item.author ?? constants.unknown,
            title: item.title ?? "",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsView(
                    description: item.description ?? "",
                    imageUrl: item.urlToImage ?? constants.noImage,
                    sourceName: item.source?.name ?? "",
                    author: item.author ?? constants.unknown,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
