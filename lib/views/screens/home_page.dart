// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/controller/api_controller.dart';
import 'package:quotes_app/controller/favorites_page_controller.dart';
import 'package:quotes_app/controller/quotes_Controller.dart';
import 'package:quotes_app/helper/api_helper_class.dart';
import 'package:quotes_app/helper/db_helper_class.dart';
import 'package:quotes_app/modals/api_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ApiController apiController = Get.put(ApiController());

  final FavoritesController _favoritesController = Get.put(FavoritesController());

  final QuotesController _quotesController = Get.put(QuotesController());

  late AnimationController controller;
  late Animation<Alignment> position;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    position = Tween<Alignment>(
      begin: const Alignment(-3, -2),
      end: const Alignment(0, 0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Hero(
          tag: 'E',
          transitionOnUserGestures: true,
          child: Text(
            "MOTIVATION",
            style: GoogleFonts.federo(),
          ),
        ),
        actions: [
          Hero(
            tag: 's',
            child: IconButton(
              onPressed: () {
                Get.toNamed('/SearchPage');
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
          ),
          Hero(
            tag: 'f',
            child: IconButton(
              onPressed: () {
                _favoritesController.getAllFavoritesQuotes;
                Get.toNamed('/FavoritesPage');
              },
              icon: const Icon(
                Icons.favorite_border_outlined,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(0, 18),
              child: AlignTransition(
                alignment: position,
                child: Container(
                  height: s.height * 0.82,
                  margin: const EdgeInsets.all(6),
                  child: FutureBuilder(
                    future: ApiHelper.apiHelper.getApi(),
                    builder: (context, snapshot) {
                      log("{] ${snapshot.data} [}");
                      if (snapshot.hasData) {
                        apiController.getData();
                        return Obx(
                          () => ListView.builder(
                            itemCount: apiController.allData.value.length,
                            itemBuilder: (context, index) {
                              ApiModal allQuotes = snapshot.data![index];
                              log("[+ ${allQuotes.author} -]");
                              return GestureDetector(
                                onTap: () {
                                  DBHelper.dbHelper.insertQuotes(
                                    quotes: allQuotes.quote,
                                    category: allQuotes.category,
                                    author: allQuotes.author,
                                  );
                                  _quotesController.getAllHistoryQuotes;

                                  Get.toNamed(
                                    "/DetailPage",
                                    arguments: allQuotes,
                                  );
                                },
                                child: Hero(
                                  tag: 'd',
                                  child: Container(
                                    padding: const EdgeInsets.all(18),
                                    margin: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.primaries[index % 18].shade50,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "${allQuotes.category} \n",
                                            style: GoogleFonts.quattrocento(
                                              fontSize: 18,
                                              letterSpacing: 2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          allQuotes.quote,
                                          style: GoogleFonts.quattrocento(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "- ${allQuotes.author}",
                                            style: GoogleFonts.quattrocento(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Error : ${snapshot.error}",
                            style: GoogleFonts.federo(
                              fontSize: 20,
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text(
                            "Finding Quotes For You !!!",
                            style: GoogleFonts.federo(
                              fontSize: 20,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
