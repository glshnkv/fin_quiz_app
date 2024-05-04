import 'package:auto_route/auto_route.dart';
import 'package:fin_quiz_app/models/quiz_model.dart';
import 'package:fin_quiz_app/router/router.dart';
import 'package:fin_quiz_app/theme/colors.dart';
import 'package:fin_quiz_app/theme/textstyles.dart';
import 'package:fin_quiz_app/widgets/action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

@RoutePage()
class QuizGameScreen extends StatefulWidget {
  final QuizModel quiz;

  const QuizGameScreen({super.key, required this.quiz});

  @override
  State<QuizGameScreen> createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {
  int result = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Continue";
  bool answered = false;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller!,
                    onPageChanged: (page) {
                      if (page == widget.quiz.quiz.length - 1) {
                        setState(() {
                          btnText = "Finish";
                        });
                      }
                      setState(() {
                        answered = false;
                      });
                    },
                    physics: new NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.router.pop();
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back_ios_new,
                                      color: AppColors.black),
                                  SizedBox(width: 5),
                                  Text('Back',
                                      style: AppTextStyles.text(
                                          AppColors.black)),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Quiz',
                                    style: AppTextStyles.h1(AppColors.black))),
                            SizedBox(height: 25),
                            Row(
                              children: [
                                Text(
                                    "${index + 1}/${widget.quiz.questionCount}",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.text(AppColors.black)),
                                SizedBox(width: 4),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: StepProgressIndicator(
                                    padding: 2,
                                    roundedEdges: Radius.circular(30),
                                    totalSteps: widget.quiz.questionCount,
                                    currentStep: index + 1,
                                    selectedColor: AppColors.blue,
                                    unselectedColor: AppColors.lightBlue,
                                    size: 10,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                  "${index + 1}\. ${widget.quiz.quiz[index].question}",
                                  style: AppTextStyles.h2(AppColors.black)),
                            ),
                            SizedBox(height: 20),
                            for (int i = 0;
                                i < widget.quiz.quiz[index].answers!.length;
                                i++)
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: !answered
                                        ? () {
                                            if (widget
                                                .quiz.quiz[index].answers!.values
                                                .toList()[i]) {
                                              result++;
                                              print(result);
                                            } else {
                                              print(result);
                                            }
                                            setState(() {
                                              btnPressed = true;
                                              answered = true;
                                            });
                                          }
                                        : null,
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: btnPressed
                                              ? widget.quiz.quiz[index].answers!
                                                      .values
                                                      .toList()[i]
                                                  ? AppColors.blue
                                                  : AppColors.lightBlue
                                              : AppColors.lightBlue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      child: Text(
                                          widget.quiz.quiz[index].answers!.keys
                                              .toList()[i],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 16.0,
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            SizedBox(height: 10),
                            ActionButtonWidget(
                              text: btnText,
                              width: double.infinity,
                              onTap: () {
                                if (_controller!.page?.toInt() ==
                                    widget.quiz.quiz.length - 1) {
                                  context.router.push(QuizResultRoute(
                                    result: result,
                                    quiz: widget.quiz,
                                  ));
                                } else {
                                  _controller!.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                  setState(() {
                                    btnPressed = false;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: widget.quiz.quiz.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
