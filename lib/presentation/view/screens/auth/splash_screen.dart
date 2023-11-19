import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
    height: double.infinity,
       decoration: BoxDecoration(
            color: Colors.white70
       ),
       child:Lottie.asset("assets/animation/splash_screen.json"),
     ),
    );
  }
}
