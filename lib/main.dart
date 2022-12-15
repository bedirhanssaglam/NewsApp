import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/constants/app/app_constants.dart';
import 'package:sizer/sizer.dart';

import 'src/core/init/dependency_injector.dart';
import 'src/core/init/main_build/main_build.dart';
import 'src/core/init/routes/routes.dart';
import 'src/core/init/theme/theme_data.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: DependencyInjector.instance.repositoryProviders,
      child: MultiBlocProvider(
        providers: DependencyInjector.instance.globalBlocProviders,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        final botToastBuilder = BotToastInit();
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppConstants.instance.appName,
          routerConfig: Routes.instance.routes,
          builder: (context, child) => botToastBuilder(
            context,
            MainBuild(child: child),
          ),
          theme: AppThemeLight.instance.theme,
        );
      },
    );
  }
}