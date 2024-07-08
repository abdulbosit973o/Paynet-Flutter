import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset("assets/lotti/splash.json", height: double.infinity, width: double.infinity),
    );
  }
}
