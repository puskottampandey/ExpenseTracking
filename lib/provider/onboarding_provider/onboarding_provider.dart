import 'package:expensetracking/view/screen/onboarding_screen/model/onboarding_screen_model.dart';
import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  //pageview onboarding
  final List<Onboarding> _content = [
    Onboarding(
        image: "assets/onboardingscreen/4.png",
        title: "Be easier to manage your own money",
        description:
            "Just using your phone, you can manage all your cashflow more easy and detail"),
    Onboarding(
        image: "assets/onboardingscreen/2.png",
        title: "Be more flexible and secure",
        description:
            "Use this platform in all your device, don't worry about anything, we protect you"),
    Onboarding(
        image: "assets/onboardingscreen/11.png",
        title: "Be more mindful spending. So, let's get started!",
        description:
            "Be mindful spending, and you will be closer to financial freedom")
  ];

  List<Onboarding> get content => _content;
  Onboarding pageview = Onboarding();

  PageController controller = PageController(initialPage: 0);
  int _currentpage = 0;
  int get currentpage => _currentpage;

  void onpagechanged(index) {
    _currentpage = index;
    notifyListeners();
  }
}
