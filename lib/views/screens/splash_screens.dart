import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/helper/splash_screens_helper.dart';
import 'package:quotes_app/views/screens/home_page.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  Widget build(BuildContext context) {
    IsSplashScreenHelper.splashscreenHelper.doneFirst();
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
                child: Hero(
                  tag: 'E',
                  child: AnimatedSplashScreen(
                    animationDuration: const Duration(
                      seconds: 1,
                    ),
                    // backgroundColor: Colors.black87,
                    splash: Transform.scale(
                      scale: 2,
                      child: Image.asset(
                        "assets/bg_gif_image/Strong Quote.gif",
                      ),
                    ),
                    curve: Curves.bounceInOut,
                    nextScreen:
                        IsSplashScreenHelper.splashscreenHelper.checkFirstTime
                            ? const HomePage()
                            : const SplashScreens(),
                    duration: 4000,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Hero(
                  tag: 'f',
                  child: Text(
                    "Welcome To Quotes App",
                    style: GoogleFonts.adventPro(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
