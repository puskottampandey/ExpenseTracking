import 'package:expensetracking/view/screen/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    });

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade500,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(110, 300, 0, 0),
        child: Column(
          children: [
            Image.asset(
              "assets/onboardingscreen/letter-e.png",
              height: MediaQuery.sizeOf(context).height * 0.18,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Text(
                "Expense Tracker",
                style: GoogleFonts.poppins(fontSize: 22, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
