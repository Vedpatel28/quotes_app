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
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ApiController apiController = Get.put(ApiController());

  final FavoritesController _favoritesController = Get.put(
    FavoritesController(),
  );

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
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/SearchPage');
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              _favoritesController.getAllFavoritesQuotes;
              Get.toNamed('/FavoritesPage');
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(150, 0),
              child: AlignTransition(
                alignment: position,
                child: AnimatedContainer(
                  height: 180,
                  width: 200,
                  curve: Curves.easeInOutQuad,
                  duration: const Duration(seconds: 1),
                  decoration: const BoxDecoration(
                    // color: const Color(0xFF414C6B),
                    image: DecorationImage(
                      image: AssetImage("assets/bg_gif_image/giphy.gif"),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 110),
              child: Container(
                height: s.height * 0.82,
                margin: const EdgeInsets.all(6),
                child: FutureBuilder(
                  future: ApiHelper.apiHelper.getApi(),
                  builder: (context, snapshot) {
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
                              child: Container(
                                padding: const EdgeInsets.all(18),
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.primaries[index % 18],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  allQuotes.quote,
                                  style: GoogleFonts.quattrocento(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          },
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
          ],
        ),
      ),
    );
  }
}
