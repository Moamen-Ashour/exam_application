import 'package:flutter/material.dart';
import 'package:flutter_study_project/configs/themes/custom_text_styles.dart';
import 'package:flutter_study_project/controllers/questions_controller.dart';
import 'package:flutter_study_project/screens/question/result_screen.dart';
import 'package:flutter_study_project/widget/common/background_decoration.dart';
import 'package:flutter_study_project/widget/common/custom_appBar.dart';
import 'package:flutter_study_project/widget/content_area.dart';
import 'package:flutter_study_project/widget/questions/answer_card.dart';
import 'package:get/get.dart';

class AnswerCheckSceeen extends GetView<QuestionsController> {
  const AnswerCheckSceeen({super.key});
  static const String routeName = '/answercheckscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          titleWidget: Obx(
            () => Text(
              "Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}",
              style: appBarTS,
            ),
          ),
          showActionIcon: true,
          onMenuActionTap: () {
            Get.toNamed(ResultScreen.routeName);
          },
        ),
        body: BackgroundDecoration(
            child: Obx(
          () => Column(children: [
            Expanded(
                child: ContentArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      controller.currentQuestion.value!.question,
                    ),
                    GetBuilder<QuestionsController>(
                        builder: (_) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (_, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: controller
                                .currentQuestion.value!.answers.length,
                            itemBuilder: (context, index) {
                              final answer = controller
                                  .currentQuestion.value!.answers[index];
                              final selectedAnswer = controller
                                  .currentQuestion.value!.selectedAnswer;
                              final correctAnswer = controller
                                  .currentQuestion.value!.correctAnswer;
                              final String answerText =
                                  '${answer.identifier}. ${answer.answer}';
                              if (correctAnswer == selectedAnswer &&
                                  answer.identifier == selectedAnswer) {
                                return CorrectAnswer(answer: answerText);
                              } else if (selectedAnswer == null) {
                                return NotAnswered(answer: answerText);
                              } else if (correctAnswer != selectedAnswer &&
                                  answer.identifier == selectedAnswer) {
                                return WrongAnswer(answer: answerText);
                              } else if (correctAnswer == answer.identifier) {
                                return CorrectAnswer(answer: answerText);
                              }

                              return AnswerCard(
                                answer: answerText,
                                onTap: () {},
                                isSelected: false,
                              );
                            },
                          );
                        },
                        id: "answer_review_list")
                  ],
                ),
              ),
            )),
          ]),
        )));
  }
}
