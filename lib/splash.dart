import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sixth_state2_project/main.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AnimatedSplashScreen(
              splash: LottieBuilder.asset('assets/animations/hPoBhSGVlS.json'),
              nextScreen: const MainSelectItems(),
              splashIconSize: 300,
              splashTransition: SplashTransition.decoratedBoxTransition,
              pageTransitionType: PageTransitionType.bottomToTop,
              animationDuration: const Duration(milliseconds: 3300),
            ),
          ),
        ],
      ),
    );
  }
}
