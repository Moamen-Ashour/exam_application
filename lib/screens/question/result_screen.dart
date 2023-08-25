import 'package:flutter/material.dart';
import 'package:flutter_study_project/configs/themes/custom_text_styles.dart';
import 'package:flutter_study_project/configs/themes/ui_parameters.dart';
import 'package:flutter_study_project/controllers/question_papers/questions_controller_extension.dart';
import 'package:flutter_study_project/controllers/questions_controller.dart';
import 'package:flutter_study_project/screens/question/answer_check_screen.dart';
import 'package:flutter_study_project/screens/question/question_number_card.dart';
import 'package:flutter_study_project/widget/common/background_decoration.dart';
import 'package:flutter_study_project/widget/common/custom_appBar.dart';
import 'package:flutter_study_project/widget/common/main_button.dart';
import 'package:flutter_study_project/widget/content_area.dart';
import 'package:flutter_study_project/widget/questions/answer_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});
  static const String routeName = '/resultscreen';

  @override
  Widget build(BuildContext context) {
    Color _textColro =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;

    Color _textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: const SizedBox(
          height: 50,
        ),
        title: controller.correctAnsweredQuestions,
      ),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
            child: ContentArea(
              child: Column(
                children: [
                  Lottie.asset("assets/images/cong.json",
                      repeat: true, width: 300, height: 280),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Congratulations',
                      style: headerText.copyWith(
                        color: _textColor,
                      ),
                    ),
                  ),
                  Text(
                    "You have ${controller.points} points",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 12, 151, 16),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Tap below question numbers to view answers",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 12, 151, 16),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                      child: GridView.builder(
                          itemCount: controller.allQuestions.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width ~/ 70,
                            childAspectRatio: 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (_, index) {
                            final _question = controller.allQuestions[index];
                            AnswerStatus _status = AnswerStatus.notanswered;
                            final _selectedAnswer = _question.selectedAnswer;
                            final _correctAnswer = _question.correctAnswer;

                            if (_selectedAnswer == _correctAnswer) {
                              _status = AnswerStatus.correct;
                            } else if (_question.selectedAnswer == null) {
                              _status = AnswerStatus.wrong;
                            } else {
                              _status = AnswerStatus.wrong;
                            }
                            return QuestionNumberCard(
                                index: index + 1,
                                status: _status,
                                onTap: () {
                                  controller.jumbQuestion(index,
                                      isGoBack: false);
                                  Get.toNamed(AnswerCheckSceeen.routeName);
                                });
                          }))
                ],
              ),
            ),
          ),
          ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: UIParameters.mobileScreenPadding,
              child: Row(
                children: [
                  Expanded(
                      child: MainButton(
                    onTap: () {
                      controller.tryAgain();
                    },
                    color: Colors.blueGrey,
                    title: "Try Again",
                  )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: MainButton(
                    onTap: () {
                      controller.saveTestResults();
                    },
                    color: Colors.blueGrey,
                    title: "Go Home",
                  )),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
