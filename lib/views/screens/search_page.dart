import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
        title: Text(
          "Search",
          style: GoogleFonts.federo(),
        ),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {

            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Search",
            ),
          ),
        ],
      ),
    );
  }
}
