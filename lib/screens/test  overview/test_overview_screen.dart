import 'package:flutter/material.dart';
import 'package:flutter_study_project/configs/themes/custom_text_styles.dart';
import 'package:flutter_study_project/configs/themes/ui_parameters.dart';
import 'package:flutter_study_project/controllers/questions_controller.dart';
import 'package:flutter_study_project/screens/home/question_card.dart';
import 'package:flutter_study_project/screens/question/question_number_card.dart';
import 'package:flutter_study_project/widget/common/background_decoration.dart';
import 'package:flutter_study_project/widget/common/custom_appBar.dart';
import 'package:flutter_study_project/widget/common/main_button.dart';
import 'package:flutter_study_project/widget/content_area.dart';
import 'package:flutter_study_project/widget/questions/answer_card.dart';
import 'package:flutter_study_project/widget/questions/count_down.dart';
import 'package:get/get.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});
  static const String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
              child: ContentArea(
                  child: Column(
            children: [
              Row(
                children: [
                  CountdownTimer(
                    color: UIParameters.isDarkMode()
                        ? Theme.of(context).textTheme.bodyText1!.color
                        : Theme.of(context).primaryColor,
                    timer: "",
                  ),
                  Obx(() => Text(
                        "${controller.time} Remaining",
                        style: countDownTimerTS(),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: controller.allQuestions.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width ~/ 70,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemBuilder: (_, index) {
                      AnswerStatus? _answerStatus;
                      if (controller.allQuestions[index].selectedAnswer !=
                          null) {
                        _answerStatus = AnswerStatus.answered;
                      }
                      return QuestionNumberCard(
                          index: index + 1,
                          status: _answerStatus,
                          onTap: () => controller.jumbQuestion(index));
                    }),
              )
            ],
          ))),
          ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: UIParameters.mobileScreenPadding,
                child: MainButton(
                  onTap: () {
                    controller.complete();
                  },
                  title: "Complete",
                ),
              ))
        ],
      )),
    );
  }
}
