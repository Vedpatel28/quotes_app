import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/controller/quotes_Controller.dart';
import 'package:quotes_app/modals/quotes_modals.dart';
import 'package:quotes_app/utils/image_utils.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final QuotesController _quotesController = Get.put(QuotesController(),);

  @override
  Widget build(BuildContext context) {

    Size s = MediaQuery.of(context).size;

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
          "History",
          style: GoogleFonts.federo(),
        ),
      ),
      body: Obx(
            () => Column(
          children: [
            SizedBox(
              height: s.height * 0.9,
              child: ListView.builder(
                itemCount: _quotesController.allHistoryQuotes.value.length,
                itemBuilder: (context, index) {
                  log("++ [ ${_quotesController.allHistoryQuotes[index].quotes} ] ++");
                  QuotesModals quotesFavoriteModals =
                  _quotesController.allHistoryQuotes[index];

                  log("++ [ ${quotesFavoriteModals.quotes} ] ++");

                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      image: DecorationImage(
                        image:
                        AssetImage("${bgImagePath}blurred background.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Text(
                      quotesFavoriteModals.quotes,
                      style: GoogleFonts.federo(
                        fontSize: 22,
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
      ),
    );
  }
}
