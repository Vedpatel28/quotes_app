import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
