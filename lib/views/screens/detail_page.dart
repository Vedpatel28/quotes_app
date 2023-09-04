import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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

  final FavoritesController _favoritesController = Get.find();

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
    Size s = MediaQuery.of(context).size;
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
        centerTitle: true,
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
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                allQuotes.category,
                style: GoogleFonts.federo(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: s.height * 0.8,
              width: s.width,
              decoration: BoxDecoration(
                color: Colors.blueAccent.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(height: s.height * 0.02),
                  Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "${bgImagePath}white quotation.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: s.height * 0.05),
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: Text(
                      allQuotes.quote,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.viaodaLibre(
                        fontSize: 28,
                        wordSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: Text(
                      "- ${allQuotes.author}",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.viaodaLibre(
                        fontSize: 26,
                        wordSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      // IconButton(
                      //   onPressed: () {
                      //     Share.share(
                      //       allQuotes.quote,
                      //       subject: allQuotes.author,
                      //     );
                      //   },
                      //   icon: const Icon(
                      //     Icons.share_outlined,
                      //   ),
                      // ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
