import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/constants/app/app_constants.dart';
import 'package:news_app/src/core/utils/singleton_mixin.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/bloc/news_bloc.dart';
import '../../../core/base/models/articles_model.dart';
import '../../../core/init/network/vexana_manager.dart';
import '../../../core/base/services/news_service.dart';
import '../../../core/components/newsCard/news_card.dart';
import '../../details/details_view.dart';

class USNewsView extends StatefulWidget {
  const USNewsView({
    super.key,
    required this.country,
  });

  final String country;

  @override
  State<USNewsView> createState() => _USNewsViewState();
}

class _USNewsViewState extends State<USNewsView> with SingletonMixin {
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
          return functions.platformIndicator();
        } else if (state is FetchNewsByCountryLoaded) {
          return _buildNewsList(state);
        } else if (state is FetchNewsByCountryError) {
          return functions.errorText(state.errorMessage);
        } else {
          return functions.errorText("Something went wrong!");
        }
      },
    );
  }

  ListView _buildNewsList(FetchNewsByCountryLoaded state) {
    return ListView.builder(
      itemCount: 20,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        ArticlesModel item = state.articles[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: NewsCard(
            imageUrl: item.urlToImage ?? AppConstants.instance.noImage,
            source: item.source?.name ?? "",
            author: item.author ?? "Unknown",
            title: item.title ?? "",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsView(
                    description: item.description ?? "",
                    imageUrl: item.urlToImage ?? AppConstants.instance.noImage,
                    sourceName: item.source?.name ?? "",
                    author: item.author ?? "Unknown",
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
