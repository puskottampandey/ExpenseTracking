import 'package:expensetracking/view/screen/onboarding_screen/model/onboarding_screen_model.dart';
import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  //pageview onboarding
  Onboarding pageview = Onboarding();
  PageController controller = PageController(initialPage: 0);
  int _currentpage = 0;
  int get currentpage => _currentpage;
  void onpagechanged(index) {
    _currentpage = index;
  }

  void indexincrease(int currentpage) {
    currentpage++;
  }
}
