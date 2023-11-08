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
    PageController controller = PageController(initialPage: 0);
    // ignore: unused_local_variable
    var currentpage = 0;
    return Scaffold(
      body: Consumer<OnboardingProvider>(builder: (context, value, child) {
        return Stack(
          children: [
            PageView.builder(
                onPageChanged: (index) {
                  value.onpagechanged(index);
                },
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemCount: value.pageview.content.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          value.pageview.content[index].image.toString(),
                          height: 200,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          value.pageview.content[index].title.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 25, color: Colors.lightBlue.shade500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          value.pageview.content[index].description.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 230,
              left: 170,
              child: SmoothPageIndicator(
                  effect: WormEffect(
                    activeDotColor: Colors.lightBlue.shade500,
                  ),
                  controller: controller,
                  count: value.pageview.content.length),
            ),
            Positioned(
              bottom: 100,
              left: 90,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minWidth: 250,
                height: 50,
                color: Colors.lightBlue.shade500,
                onPressed: () {
                  value.controller.page == 2
                      ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()))
                      : value.controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                  value.indexincrease(currentpage);
                },
                child: Text("Continue",
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.white)),
              ),
            )
          ],
        );
      }),
    );
  }
}
