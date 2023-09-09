
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/controller/quotes_Controller.dart';
import 'package:quotes_app/controller/search_controller.dart';
import 'package:quotes_app/helper/db_helper_class.dart';
import 'package:quotes_app/modals/quotes_modals.dart';
import 'package:quotes_app/utils/image_utils.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final MySearchController _searchController = Get.put(MySearchController());
  final QuotesController _quotesController = Get.find();

  @override
  Widget build(BuildContext context) {
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
          tag: 's',
          child: Text(
            "Search",
            style: GoogleFonts.federo(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                _searchController.isSearch(
                  quotes: value,
                );
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  gapPadding: 5,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                ),
                hintText: "Search",
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _searchController.search.value.length,
                  itemBuilder: (context, index) {
                    QuotesModals quotes = _searchController.search.value[index];
                    return _searchController.search.value.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              DBHelper.dbHelper.insertQuotes(
                                quotes: quotes.quotes,
                                category: quotes.category,
                                author: quotes.author,
                              );
                              _quotesController.getAllHistoryQuotes;
                              Get.toNamed(
                                "/DetailPage",
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "${bgImagePath}pngtree backdrops.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Text(
                                quotes.quotes,
                                style: GoogleFonts.federo(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              "Not Fund Data",
                              style: GoogleFonts.modernAntiqua(),
                            ),
                          );
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
