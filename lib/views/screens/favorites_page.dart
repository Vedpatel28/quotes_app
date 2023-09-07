import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/controller/favorites_page_controller.dart';
import 'package:quotes_app/modals/favorite_table_model.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  final FavoritesController _favoritesController = Get.put(
    FavoritesController(),
  );

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
        title: Hero(
          tag: 'f',
          child: Text(
            "Favorites Quotes",
            style: GoogleFonts.federo(),
          ),
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            SizedBox(
              height: s.height * 0.9,
              child: ListView.builder(
                itemCount: _favoritesController.allFavoriteQuotes.value.length,
                itemBuilder: (context, index) {
                  QuotesFavoriteModals quotesFavoriteModals =
                      _favoritesController.allFavoriteQuotes[index];
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://wallpaperset.com/w/full/3/2/6/248963.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.redAccent.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "${quotesFavoriteModals.category} \n",
                            style: GoogleFonts.quattrocento(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Text(
                          quotesFavoriteModals.quotes,
                          style: GoogleFonts.quattrocento(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "- ${quotesFavoriteModals.author}",
                            style: GoogleFonts.quattrocento(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
