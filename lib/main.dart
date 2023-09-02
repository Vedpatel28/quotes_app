import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/helper/db_helper_class.dart';

import 'views/screens/favorites_page.dart';
import 'views/screens/home_page.dart';
import 'views/screens/search_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DBHelper.dbHelper.initDB();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
          page: () => HomePage(),
        ),
        GetPage(
          name: "/SearchPage",
          page: () => SearchPage(),
        ),
        GetPage(
          name: "/FavoritesPage",
          page: () => FavoritesPage(),
        ),
      ],
    );
  }
}
