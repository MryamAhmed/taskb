import 'package:flutter/material.dart';
import 'package:taska/pages/onboarding.dart';



void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
    );
  }
}
