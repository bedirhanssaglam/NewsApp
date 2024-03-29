import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/core/base/models/source_model.dart';
import 'package:news_app/src/core/components/appbar/custom_app_bar.dart';
import 'package:news_app/src/core/components/text/custom_text.dart';
import 'package:news_app/src/core/constants/enums/routes_enums.dart';
import 'package:news_app/src/core/extensions/num_extensions.dart';
import 'package:news_app/src/core/utils/singleton_mixin.dart';
import 'package:news_app/src/view/sources/sources_news/sources_news_view.dart';
import 'package:sizer/sizer.dart';
import 'package:kartal/kartal.dart';

import '../../core/base/bloc/news_bloc.dart';
import '../../core/base/services/news_service.dart';
import 'widgets/source_card.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key});

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> with SingletonMixin {
  late NewsBloc newsBloc;

  @override
  void initState() {
    super.initState();
    newsBloc = NewsBloc(NewsService(vexanaManager.networkManager));
    newsBloc.add(FetchAllSourcesEvent());
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
              CustomText(
                "All Sources",
                textStyle: context.textTheme.headline1,
              ),
              2.h.ph,
              BlocBuilder<NewsBloc, NewsState>(
                bloc: newsBloc,
                builder: (context, state) {
                  if (state is FetchAllSourcesLoading) {
                    return functions.platformIndicator();
                  } else if (state is FetchAllSourcesLoaded) {
                    return GridView.builder(
                      itemCount: 26,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        SourceModel item = state.sources[index];
                        return Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: SourceCard(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SourcesNewsView(
                                    source: item.id ?? "",
                                  ),
                                ),
                              );
                            },
                            name: item.name ?? "",
                            description: item.description ?? "",
                          ),
                        );
                      },
                    );
                  } else if (state is FetchAllSourcesError) {
                    return functions.errorText(state.errorMessage);
                  } else {
                    return functions.errorText("Bir şeyler ters gitti!");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
