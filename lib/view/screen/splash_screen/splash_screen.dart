import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(120, 300, 0, 0),
        child: Column(
          children: [
            Image.asset(
              "assets/onboardingscreen/logo.png",
              height: MediaQuery.sizeOf(context).height * 0.18,
            ),
            const Text(
              "Expense Tracker",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
