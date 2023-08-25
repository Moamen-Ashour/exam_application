import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_study_project/configs/themes/app_dark_theme.dart';
import 'package:flutter_study_project/configs/themes/app_light_theme.dart';
import 'package:flutter_study_project/configs/themes/ui_parameters.dart';
import 'package:get/get.dart';

const Color onSurfaceTextColor = Color.fromARGB(255, 255, 255, 255);

const Color correctAnswerColor = Color.fromARGB(255, 45, 235, 28);

const Color wrongAnswerColor = Color.fromARGB(255, 241, 2, 2);

const Color notAnsweredColor = Color(0xff2a3c65);

const mainGradientLight = LinearGradient(
  colors: [
    primaryLightColorLight,
    primaryColorLight,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const mainGradientDark = LinearGradient(
  colors: [
    primaryDarkColorDark,
    primaryColorDark,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient mainGradient() =>
    UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode()
    ? const Color(0xff2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);

Color answerSelectedColor() => UIParameters.isDarkMode()
    ? Theme.of(Get.context!).cardColor.withOpacity(0.5)
    : Theme.of(Get.context!).primaryColor;

Color answerBorderColor() => UIParameters.isDarkMode()
    ? const Color.fromARGB(255, 20, 46, 158)
    : const Color.fromARGB(255, 221, 221, 221);
