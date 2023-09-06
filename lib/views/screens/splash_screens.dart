import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/helper/splash_screens_helper.dart';
import 'package:quotes_app/views/screens/home_page.dart';

class SplashScreens extends StatelessWidget {
  const SplashScreens({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenHelper.splashscreenHelper.doneFirst();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        height: 800,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              SizedBox(
                height: 200,
                child: AnimatedSplashScreen(
                  backgroundColor: const Color(0xFFf9fcf7),
                  splash: Transform.scale(
                    scale: 2,
                    child: Image.asset(
                      "assets/bg_gif_image/hello.gif",
                    ),
                  ),
                  nextScreen: const HomePage(),
                  duration: 3000,
                ),
              ),
              Text(
                "Welcome To Quotes App",
                style: GoogleFonts.adventPro(
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFf9fcf7),
    );
  }
}
