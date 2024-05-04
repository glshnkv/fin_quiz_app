import 'package:auto_route/auto_route.dart';
import 'package:fin_quiz_app/models/news_model.dart';
import 'package:fin_quiz_app/theme/colors.dart';
import 'package:fin_quiz_app/theme/textstyles.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewsInfoScreen extends StatefulWidget {
  final NewsModel news;
  const NewsInfoScreen({super.key, required this.news});

  @override
  State<NewsInfoScreen> createState() => _NewsInfoScreenState();
}

class _NewsInfoScreenState extends State<NewsInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leadingWidth: 110,
        leading: GestureDetector(
          onTap: () {
            context.router.pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColors.black),
                SizedBox(width: 5),
                Text(
                    'Back',
                    style: AppTextStyles.text(AppColors.black)
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    widget.news.image,
                    fit: BoxFit.cover,
                    height: 155,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                    widget.news.title,
                    style: AppTextStyles.h1(AppColors.blue)
                ),
                SizedBox(height: 10),
                Divider(height: 3),
                SizedBox(height: 15),
                Text(
                    widget.news.article,
                    style: AppTextStyles.text(
                        AppColors.black60)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
