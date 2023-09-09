import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class IsSplashScreenHelper {
  bool isSplashScreens = false;
  GetStorage storage = GetStorage();

  IsSplashScreenHelper._();

  static final IsSplashScreenHelper splashscreenHelper = IsSplashScreenHelper._();

  init() async {
    await storage.initStorage ? log("Initialized") : log("Initialized Failed");
  }

  final String _check = 'first';

  get checkFirstTime {
    isSplashScreens = storage.read(_check) ?? false;
    return isSplashScreens;
  }

  doneFirst() {
    isSplashScreens = true;
    storage.write(_check, isSplashScreens);
  }
}
