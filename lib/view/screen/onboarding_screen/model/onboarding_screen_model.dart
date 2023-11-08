class Onboarding {
  String? image;
  String? title;
  String? description;

  Onboarding({this.image, this.title, this.description});
}

List<Onboarding> content = [
  Onboarding(
      image: "assets/onboardingscreen/1.png",
      title: "Choose Product",
      description: "Find your best product from popular shop without delay."),
  Onboarding(
      image: "assets/onboardingscreen/2.png",
      title: "Make Payment",
      description: "There are many option avaliable for ease."),
  Onboarding(
      image: "assets/onboardingscreen/3.png",
      title: "Get Yours Order",
      description:
          "Your Product despatch within 1-2 Business day.Delivered at your doorstep")
];
