import 'package:flutter/material.dart';
import 'package:flutter_study_project/configs/themes/app_colors.dart';
import 'package:flutter_study_project/screens/home/home_screen.dart';
import 'package:flutter_study_project/widget/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  static const String routeName = '/introduction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(gradient: mainGradient()),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  size: 65,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 40,
                ),
                const Text(
                  "This is a study app, You can use it as you want , If you understand how this works, you would be able to scale it.",
                  style: TextStyle(
                    fontSize: 18,
                    color: onSurfaceTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                IconButton(
                    onPressed: () {
                      Get.offNamed(HomeScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 35,
                      color: Colors.white,
                    ))
              ],
            ),
          )),
    );
  }
}
