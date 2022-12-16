import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/base/services/interface_news_service.dart';
import 'package:provider/provider.dart';
import 'package:vexana/vexana.dart';

import '../../view/intro/provider/current_page_provider.dart';
import '../base/bloc/news_bloc.dart';
import '../base/services/news_service.dart';
import 'network/vexana_manager.dart';

class DependencyInjector {
  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  late final INetworkManager networkManager;
  late final INewsService newsService;
  late final NewsBloc newsBloc;

  DependencyInjector._init() {
    networkManager = VexanaManager.instance.networkManager;
    newsService = NewsService(networkManager);
    newsBloc = NewsBloc(newsService);
  }

  List<RepositoryProvider> get repositoryProviders => [
        RepositoryProvider<INewsService>(create: (context) => newsService),
      ];

  List<BlocProvider<Bloc>> get globalBlocProviders => [
        BlocProvider<NewsBloc>(create: (context) => newsBloc),
      ];

  List<ChangeNotifierProvider<ChangeNotifier>> get otherProviders => [
        ChangeNotifierProvider<CurrentPageProvider>(
            create: (context) => CurrentPageProvider()),
      ];
}
