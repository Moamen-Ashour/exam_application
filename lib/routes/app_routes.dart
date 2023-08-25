import 'package:flutter_study_project/controllers/question_papers/question_paper_controller.dart';
import 'package:flutter_study_project/controllers/questions_controller.dart';
import 'package:flutter_study_project/controllers/zoom_drawer_controller.dart';
import 'package:flutter_study_project/screens/home/home_screen.dart';
import 'package:flutter_study_project/screens/introduction/introduction.dart';
import 'package:flutter_study_project/screens/login/login_screen.dart';
import 'package:flutter_study_project/screens/question/answer_check_screen.dart';
import 'package:flutter_study_project/screens/question/question_screen.dart';
import 'package:flutter_study_project/screens/question/result_screen.dart';
import 'package:flutter_study_project/screens/splash/splash_screen.dart';
import 'package:flutter_study_project/screens/test%20%20overview/test_overview_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => SplashScreen(),
        ),
        GetPage(
          name: AppIntroductionScreen.routeName,
          page: () => AppIntroductionScreen(),
        ),
        GetPage(
            name: HomeScreen.routeName,
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
        ),
        GetPage(
            name: QuestionScreen.routeName,
            page: () => QuestionScreen(),
            binding: BindingsBuilder(() {
              Get.put<QuestionsController>(QuestionsController());
            })),
        GetPage(
          name: TestOverviewScreen.routeName,
          page: () => TestOverviewScreen(),
        ),
        GetPage(
          name: ResultScreen.routeName,
          page: () => ResultScreen(),
        ),
        GetPage(
          name: AnswerCheckSceeen.routeName,
          page: () => AnswerCheckSceeen(),
        ),
      ];
}
