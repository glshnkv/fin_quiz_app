import 'package:fin_quiz_app/models/question_model.dart';
import 'package:fin_quiz_app/models/quiz_result_model.dart';

class QuizModel {
  final List<QuestionModel> quiz;
  final int questionCount;
  List<QuizResultModel> results;


  QuizModel(
      {required this.quiz,
        required this.questionCount,
        required this.results});
}