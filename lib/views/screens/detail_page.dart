import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/helper/db_helper_class.dart';
import 'package:quotes_app/controller/favorites_page_controller.dart';
import 'package:quotes_app/modals/api_modal.dart';
import 'package:quotes_app/utils/image_utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late AnimationController controller;

  late Animation<Alignment> position;

  final FavoritesController _favoritesController = Get.find(
  );

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();

    position = Tween<Alignment>(
      begin: const Alignment(-3, -2),
      end: const Alignment(-1.8, -1.1),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ApiModal allQuotes = ModalRoute.of(context)!.settings.arguments as ApiModal;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        title: Text(
          "Quotes Details",
          style: GoogleFonts.federo(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/HistoryPage');
            },
            icon: const Icon(Icons.history_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                allQuotes.category,
                style: GoogleFonts.federo(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Stack(
              children: [
                AlignTransition(
                  alignment: position,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        image:
                            AssetImage("${bgImagePath}blurred background.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: AlignTransition(
                      alignment: position,
                      child: Text(
                        allQuotes.quote,
                        style: GoogleFonts.federo(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(340, 5),
                  child: IconButton(
                    onPressed: () {
                      log(" == ${allQuotes.category}  ==  +");

                      DBHelper.dbHelper.insertLikeQuotes(
                        quotes: allQuotes.quote,
                        category: allQuotes.category,
                        author: allQuotes.author,
                      );

                      _favoritesController.getAllFavoritesQuotes;
                      log(" == ${allQuotes.quote}  ==  +");
                      Get.snackbar("Successful", "Added To Favorites");
                      Get.toNamed(
                        "/FavoritesPage",
                      );

                      _favoritesController.getAllFavoritesQuotes;
                    },
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                      color: Colors.redAccent.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
