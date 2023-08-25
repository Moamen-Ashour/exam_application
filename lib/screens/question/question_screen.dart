import 'package:flutter/material.dart';
import 'package:flutter_study_project/configs/themes/app_colors.dart';
import 'package:flutter_study_project/configs/themes/custom_text_styles.dart';
import 'package:flutter_study_project/configs/themes/ui_parameters.dart';
import 'package:flutter_study_project/controllers/questions_controller.dart';
import 'package:flutter_study_project/firebase_ref/loading_status.dart';
import 'package:flutter_study_project/screens/test%20%20overview/test_overview_screen.dart';
import 'package:flutter_study_project/widget/common/background_decoration.dart';
import 'package:flutter_study_project/widget/common/custom_appBar.dart';
import 'package:flutter_study_project/widget/common/main_button.dart';
import 'package:flutter_study_project/widget/common/question_placeholder.dart';
import 'package:flutter_study_project/widget/content_area.dart';
import 'package:flutter_study_project/widget/questions/answer_card.dart';
import 'package:flutter_study_project/widget/questions/count_down.dart';
import "package:get/get.dart";

class QuestionScreen extends GetView<QuestionsController> {
  const QuestionScreen({super.key});
  static const String routeName = '/question_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: const ShapeDecoration(
                shape: StadiumBorder(
                    side: BorderSide(color: onSurfaceTextColor, width: 2))),
            child: Obx(() => CountdownTimer(
                  timer: controller.time.value,
                  color: onSurfaceTextColor,
                )),
          ),
          showActionIcon: true,
          titleWidget: Obx(
            () => Text(
              "Q ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}",
              style: appBarTS,
            ),
          ),
        ),
        body: BackgroundDecoration(
          child: Obx(() => Column(
                children: [
                  if (controller.loadingStatus.value == LoadingStatus.loading)
                    const Expanded(
                        child: ContentArea(child: QuestionScreenHolder())),
                  if (controller.loadingStatus.value == LoadingStatus.completed)
                    Expanded(
                        child: ContentArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          top: 25,
                        ),
                        child: Column(
                          children: [
                            Text(
                              controller.currentQuestion.value!.question,
                              style: questionTS,
                            ),
                            GetBuilder<QuestionsController>(
                                id: "answers_list",
                                builder: (context) {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(
                                      top: 45,
                                    ),
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final answer = controller.currentQuestion
                                          .value!.answers[index];

                                      return AnswerCard(
                                        answer:
                                            "${answer.identifier}. ${answer.answer}",
                                        onTap: () {
                                          controller.selectedAnswer(
                                            answer.identifier,
                                          );
                                        },
                                        isSelected: answer.identifier ==
                                            controller.currentQuestion.value!
                                                .selectedAnswer,
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: 20,
                                    ),
                                    itemCount: controller
                                        .currentQuestion.value!.answers.length,
                                  );
                                }),
                          ],
                        ),
                      ),
                    )),
                  ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: UIParameters.mobileScreenPadding,
                      child: Row(
                        children: [
                          Visibility(
                              visible: controller.isFirstQuestion,
                              child: SizedBox(
                                width: 55,
                                height: 55,
                                child: MainButton(
                                  onTap: () {
                                    controller.prevQuestion();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Get.isDarkMode
                                        ? onSurfaceTextColor
                                        : Theme.of(context).primaryColor,
                                  ),
                                ),
                              )),
                          Expanded(
                            child: Visibility(
                              visible: controller.loadingStatus.value ==
                                  LoadingStatus.completed,
                              child: MainButton(
                                onTap: () {
                                  controller.isLastQuestion
                                      ? Get.toNamed(
                                          TestOverviewScreen.routeName)
                                      : controller.nextQuestion();
                                },
                                title: controller.isLastQuestion
                                    ? 'Complete'
                                    : "Next",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
