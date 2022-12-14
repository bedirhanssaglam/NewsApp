import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instance;
  static VexanaManager get instance {
    if (_instance != null) return _instance!;
    _instance = VexanaManager._init();
    return _instance!;
  }

  static const String baseUrl = "https://newsapi.org/v2/";

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    isEnableTest: true,
    options: BaseOptions(
      baseUrl: baseUrl,
      followRedirects: true,
    ),
  );
}
