import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/helper/favorites_page_controller.dart';
import 'package:quotes_app/modals/favorite_table_model.dart';
import 'package:quotes_app/utils/image_utils.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  final FavoritesController _favoritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    // ApiModal allQuotes = ModalRoute.of(context)!.settings.arguments as ApiModal;

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
          "Favorites",
          style: GoogleFonts.federo(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: s.height * 0.5,
            child: ListView.builder(
              itemCount: _favoritesController.allFavoriteQuotes.value.length,
              itemBuilder: (context, index) {
                log("++ [ ${_favoritesController.allFavoriteQuotes[index].quotes} ] ++");
                QuotesFavoriteModals quotesFavoriteModals =
                    _favoritesController.allFavoriteQuotes[index];

                log("++ [ ${quotesFavoriteModals.quotes} ] ++");

                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      image: AssetImage("${bgImagePath}plain backgrounds.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    quotesFavoriteModals.quotes,
                    style: GoogleFonts.federo(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
