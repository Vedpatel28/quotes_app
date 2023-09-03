
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/controller/api_controller.dart';
import 'package:quotes_app/helper/api_helper_class.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: GoogleFonts.federo(),
        ),
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
        child: Column(
          children: [
            Container(
              height: s.height * 0.8,
              margin: const EdgeInsets.all(6),
              child: FutureBuilder(
                future: ApiHelper.apiHelper.getApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    apiController.getData();
                    return ListView.builder(
                      itemCount: apiController.allData.value.length,
                      itemBuilder: (context, index) {
                        String quotes = snapshot.data![index].quote;
                        return Container(
                          padding: const EdgeInsets.all(18),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.primaries[index % 18],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Text(
                            quotes,
                            style: GoogleFonts.quattrocento(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      },
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
          ],
        ),
      ),
    );
  }
}
