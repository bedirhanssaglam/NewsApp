import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/core/constants/enums/routes_enums.dart';
import 'package:news_app/src/view/details/details_view.dart';
import 'package:news_app/src/view/home/home_view.dart';
import 'package:news_app/src/view/intro/intro_view.dart';
import 'package:news_app/src/view/searched_news/searched_news_view.dart';
import 'package:news_app/src/view/sources/sources_view.dart';
import 'package:news_app/src/view/splash/splash_view.dart';

import '../../base/functions/base_functions.dart';

final GlobalKey<NavigatorState> mainNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'main');

class Routes {
  static Routes? _instance;
  static Routes get instance {
    _instance ??= Routes._init();
    return _instance!;
  }

  Routes._init();

  GoRouter routes = GoRouter(
    navigatorKey: mainNavigatorKey,
    initialLocation: RouteEnums.splash.routeName,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: RouteEnums.splash.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: const SplashView(),
          );
        },
      ),
      GoRoute(
        path: RouteEnums.intro.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: IntroView(),
          );
        },
      ),
      GoRoute(
        path: RouteEnums.home.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: RouteEnums.details.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: DetailsView(
              description: state.params['description'] ?? "",
              imageUrl: state.params['imageUrl'] ?? "",
              sourceName: state.params['sourceName'] ?? "",
              author: state.params['author'] ?? "",
            ),
          );
        },
      ),
      GoRoute(
        path: RouteEnums.searchedNews.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: SearchedNewsView(
              searchWord: state.params['searchWord'] ?? "",
            ),
          );
        },
      ),
      GoRoute(
        path: RouteEnums.sources.routeName,
        pageBuilder: (context, state) {
          return animatedRouting(
            state: state,
            route: const SourcesView(),
          );
        },
      ),
      // GoRoute(
      //   path: RouteEnums.sourcesNews.routeName,
      //   pageBuilder: (context, state) {
      //     return animatedRouting(
      //       state: state,
      //       route: const SourcesNewsView(),
      //     );
      //   },
      // ),
    ],
  );
}
