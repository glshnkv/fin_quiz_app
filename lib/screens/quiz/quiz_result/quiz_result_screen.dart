import 'package:auto_route/auto_route.dart';
import 'package:fin_quiz_app/models/quiz_model.dart';
import 'package:fin_quiz_app/models/quiz_result_model.dart';
import 'package:fin_quiz_app/router/router.dart';
import 'package:fin_quiz_app/theme/colors.dart';
import 'package:fin_quiz_app/theme/textstyles.dart';
import 'package:fin_quiz_app/widgets/action_button_widget.dart';

import 'package:flutter/material.dart';

@RoutePage()
class QuizResultScreen extends StatefulWidget {
  final int result;
  final QuizModel quiz;

  const QuizResultScreen({super.key, required this.result, required this.quiz});

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  final List<String> resultMessages = [
    'You have successfully answered all the questions, way to go!',
    'You have a good grasp of the basics!',
    'You\'ll definitely make it next time',
  ];

  String message = '';
  String imageUrl = '';

  @override
  void initState() {
    getMessage();
    super.initState();
  }

  void getMessage() {
    if (widget.result == 15) {
      message = resultMessages[0];
      imageUrl = 'assets/images/quiz/perfect.png';
    } else if (widget.result > 8 && widget.result < 15) {
      message = resultMessages[1];
      imageUrl = 'assets/images/quiz/middle.png';
    } else {
      message = resultMessages[2];
      imageUrl = 'assets/images/quiz/low.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Your Score', style: AppTextStyles.h1(AppColors.black))),
                Image.asset(imageUrl),
                Column(
                  children: [
                    Text('${widget.result} of ${widget.quiz.questionCount}',
                        style: AppTextStyles.h1(AppColors.blue)),
                    Text(message, textAlign: TextAlign.center, style: AppTextStyles.text(AppColors.black)),
                  ],
                ),
                ActionButtonWidget(
                    text: 'Next',
                    width: MediaQuery.of(context).size.width * 0.8,
                    onTap: () {
                      final QuizResultModel resultModel = QuizResultModel(
                          count: widget.result,
                          message: message,
                          date: DateTime.now());
                      widget.quiz.results.insert(0, resultModel);
                      context.router.push(MainRoute());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}