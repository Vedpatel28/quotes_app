import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/helper/db_helper_class.dart';
import 'package:quotes_app/helper/splash_screens_helper.dart';
import 'package:quotes_app/views/screens/splash_screens.dart';
import 'views/screens/create_quotes.dart';
import 'views/screens/favorites_page.dart';
import 'views/screens/history_page.dart';
import 'views/screens/home_page.dart';
import 'views/screens/search_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DBHelper.dbHelper.initDB();

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
          page: () => SplashScreenHelper.splashscreenHelper.checkFirstTime
              ? HomePage()
              : const SplashScreens()
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
          name: "/QuotesCreatePage",
          page: () => QuotesCreatePage(),
        ),
        GetPage(
          name: "/HistoryPage",
          page: () => HistoryPage(),
        ),
      ],
    );
  }
}
