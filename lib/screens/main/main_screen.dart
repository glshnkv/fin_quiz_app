import 'package:auto_route/auto_route.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:fin_quiz_app/screens/finance/finance_list/finance_list_screen.dart';
import 'package:fin_quiz_app/screens/news/news_list/news_list_screen.dart';
import 'package:fin_quiz_app/screens/quiz/quiz_list/quiz_list_screen.dart';
import 'package:fin_quiz_app/screens/settings/settings_screen.dart';
import 'package:fin_quiz_app/theme/colors.dart';
import 'package:fin_quiz_app/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final _tabs = [
    FinanceListScreen(),
    QuizListScreen(),
    NewsListScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: CustomNavigationBar(
          iconSize: 25.0,
          strokeColor: AppColors.blue,
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              selectedIcon: Center(
                  child: SvgPicture.asset('assets/images/nav-bar/finance.svg',
                      color: AppColors.blue)),
              icon: Center(
                  child: SvgPicture.asset('assets/images/nav-bar/finance.svg',
                      color: AppColors.black60)),
              title: Text(
                'Home',
                style: AppTextStyles.text2(AppColors.black60),
              ),
              selectedTitle: Text(
                'Home',
                style: AppTextStyles.text2(AppColors.blue),
              ),
            ),
            CustomNavigationBarItem(
              selectedIcon: Center(
                  child: SvgPicture.asset('assets/images/nav-bar/quiz.svg',
                      color: AppColors.blue)),
              icon: Center(
                  child: SvgPicture.asset('assets/images/nav-bar/quiz.svg',
                      color: AppColors.black60)),
              title: Text(
                'Quiz',
                style: AppTextStyles.text2(AppColors.black60),
              ),
              selectedTitle: Text(
                'Quiz',
                style: AppTextStyles.text2(AppColors.blue),
              ),
            ),
            CustomNavigationBarItem(
              selectedIcon: Center(
                  child: SvgPicture.asset('assets/images/nav-bar/news.svg',
                      color: AppColors.blue)),
              icon: Center(
                  child: SvgPicture.asset('assets/images/nav-bar/news.svg',
                      color: AppColors.black60)),
              title: Text(
                'News',
                style: AppTextStyles.text2(AppColors.black60),
              ),
              selectedTitle: Text(
                'News',
                style: AppTextStyles.text2(AppColors.blue),
              ),
            ),
            CustomNavigationBarItem(
              selectedIcon: Center(
                  child: SvgPicture.asset('assets/images/nav-bar/settings.svg',
                      color: AppColors.blue)),
              icon: Center(
                  child: SvgPicture.asset('assets/images/nav-bar/settings.svg',
                      color: AppColors.black60)),
              title: Text(
                'Settings',
                style: AppTextStyles.text2(AppColors.black60),
              ),
              selectedTitle: Text(
                'Settings',
                style: AppTextStyles.text2(AppColors.blue),
              ),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
