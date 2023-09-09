import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/helper/db_helper_class.dart';
import 'package:quotes_app/helper/splash_screens_helper.dart';
import 'package:quotes_app/views/screens/detail_page.dart';
import 'package:quotes_app/views/screens/splash_screens.dart';
import 'views/screens/favorites_page.dart';
import 'views/screens/history_page.dart';
import 'views/screens/home_page.dart';
import 'package:get_storage/get_storage.dart';
import 'views/screens/search_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DBHelper.dbHelper.initDB();

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: "/",
          page: () => IsSplashScreenHelper.splashscreenHelper.checkFirstTime
              ? const SplashScreens()
              : const HomePage(),
        ),
        GetPage(
          name: "/SearchPage",
          page: () => SearchPage(),
        ),
        GetPage(
          name: "/FavoritesPage",
          page: () => FavoritesPage(),
        ),
        GetPage(
          name: "/HistoryPage",
          page: () => HistoryPage(),
        ),
        GetPage(
          name: "/DetailPage",
          page: () => DetailPage(),
        ),
      ],
    );
  }
}
