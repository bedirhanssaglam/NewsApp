import 'package:news_app/src/core/base/functions/base_functions.dart';
import 'package:news_app/src/core/constants/app/app_constants.dart';
import 'package:news_app/src/core/constants/app/color_constants.dart';
import 'package:news_app/src/core/init/network/vexana_manager.dart';

import '../init/routes/routes.dart';

mixin SingletonMixin {
  BaseFunctions get functions => BaseFunctions.instance;
  AppConstants get constants => AppConstants.instance;
  ColorConstants get colors => ColorConstants.instance;
  Routes get routes => Routes.instance;
  VexanaManager get vexanaManager => VexanaManager.instance;
}
