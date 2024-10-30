import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bmi_cal/home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/bmilogo.png",
            width: MediaQuery.of(context).size.width * 0.4, // Responsive
          ),
          const SizedBox(height: 20),
          Text(
            "BMI Calculator",
            style: GoogleFonts.lato(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            "Find your Health State",
            style: GoogleFonts.lato(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.cyanAccent,
            ),
          ),
          CircularProgressIndicator(
            color: Colors.white,

          ),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      nextScreen: const HomePage(),
      splashIconSize: 500,
      duration: 2500,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
