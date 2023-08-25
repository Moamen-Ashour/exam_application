import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_study_project/configs/themes/app_colors.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(gradient: mainGradient()),
          alignment: Alignment.center,
          child: Lottie.asset("assets/images/app_splash_logo.json",
              repeat: false, width: 200, height: 200)
          /*  Image.asset(
          "assets/images/app_splash_logo.png",
          width: 200,
          height: 200,
        ), */
          ),
    );
  }
}
