import 'package:get_storage/get_storage.dart';

class SplashScreenHelper {

  SplashScreenHelper._();
  static final SplashScreenHelper splashscreenHelper = SplashScreenHelper._();

  GetStorage storage = GetStorage();

  final String _check = 'first';

  get checkFirstTime {
    return storage.read(_check) ?? true;
  }

  doneFirst() {
    storage.write(_check, false);
  }
}