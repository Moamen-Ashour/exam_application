import 'package:flutter/material.dart';
import 'package:flutter_study_project/bindings/initial_binding.dart';
import 'package:flutter_study_project/configs/themes/app_light_theme.dart';
import 'package:flutter_study_project/controllers/question_papers/data_uploader_screen.dart';
import 'package:flutter_study_project/controllers/theme_controller.dart';
import 'package:flutter_study_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_study_project/screens/introduction/introduction.dart';
import 'package:flutter_study_project/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

/* 
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(MyApp());
} */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: Get.find<ThemeController>().lightTheme,
        debugShowCheckedModeBanner: false,
        getPages: AppRoutes.routes());
  }
}
