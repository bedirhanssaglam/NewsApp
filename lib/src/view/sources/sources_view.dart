import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/base/models/source_model.dart';
import 'package:sizer/sizer.dart';

import 'package:news_app/src/core/base/functions/base_functions.dart';
import 'package:news_app/src/core/init/network/vexana_manager.dart';

import '../../core/base/bloc/news_bloc.dart';
import '../../core/base/services/news_service.dart';
import 'widgets/source_card.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key});

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late NewsBloc newsBloc;

  @override
  void initState() {
    super.initState();
    newsBloc = NewsBloc(NewsService(VexanaManager.instance.networkManager));
    newsBloc.add(FetchAllSourcesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: newsBloc,
      builder: (context, state) {
        if (state is FetchAllSourcesLoading) {
          return platformIndicator();
        } else if (state is FetchAllSourcesLoaded) {
          return GridView.builder(
            itemCount: 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              SourceModel item = state.sources[index];
              return Padding(
                padding: EdgeInsets.all(5.sp),
                child: SourceCard(
                  onTap: () {},
                  name: item.name ?? "",
                  description: item.description ?? "",
                ),
              );
            },
          );
        } else if (state is FetchAllSourcesError) {
          return errorText(state.errorMessage);
        } else {
          return errorText("Bir şeyler ters gitti!");
        }
      },
    );
  }
}
