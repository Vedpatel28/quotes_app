import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                height: 300,
                child: AnimatedSplashScreen(
                  splash: Transform.scale(
                    scale: 5,
                    child: SpinKitWaveSpinner(
                      size: 200,
                      color: Colors.indigo.withOpacity(0.5),
                      waveColor: Colors.indigoAccent.withOpacity(0.2),
                      trackColor: Colors.blue.withOpacity(0.3),
                    ),
                  ),
                  nextScreen: HomePage(),
                  duration: 3000,
                ),
              ),
              Text(
                "Welcome To Quotes App",
                style: GoogleFonts.adventPro(
                  textStyle: const TextStyle(
                    fontSize: 25,
                    color: Colors.blueAccent,
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
