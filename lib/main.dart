import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/constants/app/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'src/core/base/bloc/bloc_observer/app_bloc_observer.dart';
import 'src/core/init/dependency_injector.dart';
import 'src/core/init/routes/routes.dart';
import 'src/core/init/theme/theme_data.dart';

void main() {
  Bloc.observer = AppBlocObserver.instance;
  runApp(
    MultiRepositoryProvider(
      providers: DependencyInjector.instance.repositoryProviders,
      child: MultiBlocProvider(
        providers: DependencyInjector.instance.globalBlocProviders,
        child: MultiProvider(
          providers: DependencyInjector.instance.otherProviders,
          child: const MyApp(),
        ),
      ),
    ),
  );
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppConstants.instance.appName,
          routerConfig: Routes.instance.routes,
          theme: AppThemeLight.instance.theme,
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
