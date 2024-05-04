import 'package:auto_route/auto_route.dart';
import 'package:fin_quiz_app/models/news_model.dart';
import 'package:fin_quiz_app/repository/news_repository.dart';
import 'package:fin_quiz_app/router/router.dart';
import 'package:fin_quiz_app/theme/colors.dart';
import 'package:fin_quiz_app/theme/textstyles.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'News',
                    style: AppTextStyles.h1(AppColors.black),
                  ),
                ),
                Container(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: newsRepository.length,
                    separatorBuilder: (BuildContext context, int index) =>
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: const Divider(height: 3),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final NewsModel _news = newsRepository[index];
                      return GestureDetector(
                        onTap: () {
                          context.router.push(NewsInfoRoute(news: _news));
                        },
                        child: Column(
                          children: [
                            Text(
                              _news.title,
                              style: AppTextStyles.h2(AppColors.black),
                            ),
                            SizedBox(height: 10),
                            Text(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              _news.article,
                              style: AppTextStyles.text2(AppColors.black70),
                            ),
                            SizedBox(height: 10),
                            ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                              child: Image.asset(
                                _news.image,
                                fit: BoxFit.cover,
                                height: 145,
                                width: double.infinity,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
