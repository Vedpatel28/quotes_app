import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/controller/quotes_Controller.dart';
import 'package:quotes_app/modals/quotes_modals.dart';
import 'package:quotes_app/utils/image_utils.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final QuotesController _quotesController = Get.put(
    QuotesController(),
  );

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
        title: Hero(
          tag: 'h',
          child: Text(
            "History",
            style: GoogleFonts.federo(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: s.height * 0.9,
                child: ListView.builder(
                  itemCount: _quotesController.allHistoryQuotes.value.length,
                  itemBuilder: (context, index) {
                    QuotesModals quotesFavoriteModals =
                        _quotesController.allHistoryQuotes[index];
                    log("++ [ ${quotesFavoriteModals.quotes} ] ++");
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.primaries[index % 18].shade200,
                          width: 10,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            "${bgImagePath}istockphoto.webp",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        quotesFavoriteModals.quotes,
                        style: GoogleFonts.quattrocento(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
