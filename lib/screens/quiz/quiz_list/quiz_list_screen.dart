import 'package:auto_route/auto_route.dart';
import 'package:fin_quiz_app/models/quiz_result_model.dart';
import 'package:fin_quiz_app/repository/quiz_repository.dart';
import 'package:fin_quiz_app/router/router.dart';
import 'package:fin_quiz_app/theme/colors.dart';
import 'package:fin_quiz_app/theme/textstyles.dart';
import 'package:fin_quiz_app/widgets/action_button_widget.dart';
import 'package:fin_quiz_app/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class QuizListScreen extends StatefulWidget {
  const QuizListScreen({super.key});

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: quiz.results.isEmpty
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Quiz',
                              style: AppTextStyles.h1(AppColors.black))),
                      Column(
                        children: [
                          Image.asset('assets/images/quiz/empty-result.png'),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 250,
                            child: Text('Check how much you know about finance',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.h2(AppColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Quiz',
                          style: AppTextStyles.h1(AppColors.black))),
                  ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: quiz.results.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 15),
                      itemBuilder: (BuildContext context, int index) {
                        final QuizResultModel _result = quiz.results[index];
                        return Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${_result.date.day}/${_result.date.month}/${_result.date.year}',
                                  style: AppTextStyles.text(AppColors.black40)),
                              SizedBox(height: 5),
                              Text('${_result.count}/${quiz.questionCount}',
                                  style: AppTextStyles.h1(AppColors.blue)),
                              SizedBox(height: 5),
                              Text(_result.message,
                                  style: AppTextStyles.text(AppColors.black70)),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
        text: 'Start',
        width: MediaQuery.of(context).size.width * 0.9,
        onTap: () {
          context.router.push(QuizGameRoute(quiz: quiz));
        },
      ),
    );
  }
}
