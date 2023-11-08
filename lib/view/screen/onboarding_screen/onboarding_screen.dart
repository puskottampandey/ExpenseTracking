import 'package:expensetracking/provider/onboarding_provider/onboarding_provider.dart';
import 'package:expensetracking/view/screen/home_screen/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<OnboardingProvider>(builder: (context, value, child) {
        return Stack(
          children: [
            PageView.builder(
                onPageChanged: (index) {
                  value.onpagechanged(index);
                },
                scrollDirection: Axis.horizontal,
                controller: value.controller,
                itemCount: value.content.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(40, 100, 40, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          value.content[index].image.toString(),
                          height: 250,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          value.content[index].title.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          value.content[index].description.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 200,
              left: 170,
              child: SmoothPageIndicator(
                  effect: WormEffect(
                    activeDotColor: Colors.lightBlue.shade500,
                  ),
                  controller: value.controller,
                  count: value.content.length),
            ),
            Positioned(
              left: 220,
              bottom: 95,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                minWidth: 160,
                height: 50,
                color: Colors.lightBlue.shade500,
                onPressed: () {
                  value.currentpage == 2
                      ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()))
                      : value.controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                },
                child: Text(value.currentpage != 2 ? "Next" : "Get Started",
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.white)),
              ),
            ),
          ],
        );
      }),
    );
  }
}
