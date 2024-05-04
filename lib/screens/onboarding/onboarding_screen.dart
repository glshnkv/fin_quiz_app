import 'package:auto_route/auto_route.dart';
import 'package:fin_quiz_app/router/router.dart';
import 'package:fin_quiz_app/theme/colors.dart';
import 'package:fin_quiz_app/theme/textstyles.dart';
import 'package:fin_quiz_app/widgets/action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: WormEffect(
                  activeDotColor: AppColors.blue,
                  dotColor: AppColors.lightBlue,
                  dotHeight: 12,
                  dotWidth: 32,
                  radius: 20,
                ),
              ),
            ),
            Spacer(flex: 1),
            Container(
              height: 500,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 1;
                  });
                },
                controller: controller,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/onboarding/1.png'),
                        RichText(
                            text: TextSpan(
                              text: 'Welcome to ',
                              style: AppTextStyles.h2(AppColors.black),
                              children: [
                                TextSpan(
                                  text: 'our app!',
                                  style: AppTextStyles.h2(AppColors.blue),
                                )
                              ],
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            'Discover a new level of financial management and fun with our app!',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.text2(AppColors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/onboarding/2.png'),
                        RichText(
                            text: TextSpan(
                              text: 'Your cash flow is ',
                              style: AppTextStyles.h2(AppColors.black),
                              children: [
                                TextSpan(
                                  text: 'under control',
                                  style: AppTextStyles.h2(AppColors.blue),
                                )
                              ],
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            'Keep track of your income with our convenient tools and plan your finances easily.',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.text2(AppColors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
      floatingActionButton: ActionButtonWidget(
        text: 'Next',
        width: MediaQuery.of(context).size.width * 0.9,
        onTap: () {
          isLastPage ? context.router.push(MainRoute()) :
          controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
      ),
    );
  }
}
