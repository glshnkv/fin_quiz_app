import 'package:auto_route/auto_route.dart';
import 'package:fin_quiz_app/screens/finance/add_finance/add_finance_screen.dart';
import 'package:fin_quiz_app/screens/finance/finance_list/finance_list_screen.dart';
import 'package:fin_quiz_app/screens/main/main_screen.dart';
import 'package:fin_quiz_app/screens/news/news_info/news_info_screen.dart';
import 'package:fin_quiz_app/screens/news/news_list/news_list_screen.dart';
import 'package:fin_quiz_app/screens/onboarding/onboarding_screen.dart';
import 'package:fin_quiz_app/screens/quiz/quiz_game/quiz_game_screen.dart';
import 'package:fin_quiz_app/screens/quiz/quiz_list/quiz_list_screen.dart';
import 'package:fin_quiz_app/screens/quiz/quiz_result/quiz_result_screen.dart';
import 'package:fin_quiz_app/screens/settings/settings_screen.dart';
import 'package:fin_quiz_app/models/news_model.dart';
import 'package:fin_quiz_app/models/quiz_model.dart';


import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: NewsListRoute.page),
    AutoRoute(page: NewsInfoRoute.page),
    AutoRoute(page: AddFinanceRoute.page),
    AutoRoute(page: QuizListRoute.page),
    AutoRoute(page: QuizGameRoute.page),
    AutoRoute(page: QuizResultRoute.page),

  ];
}