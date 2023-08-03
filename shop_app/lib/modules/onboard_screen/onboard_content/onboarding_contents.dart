class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Welcome to ebey, Let’s shop!",
    image: "assets/images/splash_1.png",
    desc: "",
  ),
  OnboardingContents(
    title: "We help people conect with store \naround United State of America",
    image: "assets/images/splash_2.png",
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: "We show the easy way to shop. \nJust stay at home with us",
    image: "assets/images/splash_3.png",
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
