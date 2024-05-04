import 'package:auto_route/auto_route.dart';
import 'package:fin_quiz_app/screens/settings/widgets/settings_tile.dart';
import 'package:fin_quiz_app/theme/colors.dart';
import 'package:fin_quiz_app/theme/textstyles.dart';
import 'package:fin_quiz_app/widgets/app_container.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                    style: AppTextStyles.h1(AppColors.black)
                ),
              ),
              SizedBox(height: 10),
              AppContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Give us 5 star!',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Your feedback helps us to improve',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/settings/rate-image.png',
                      width: 110,
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              SettingsTile(
                  iconPath: 'assets/images/settings/terms.svg',
                  title: 'Terms & Conditions',
                  onTap: () {}),
              SizedBox(height: 15),
              SettingsTile(
                  iconPath: 'assets/images/settings/privacy.svg',
                  title: 'Privacy Policy',
                  onTap: () {}),
              SizedBox(height: 15),
              SettingsTile(
                  iconPath: 'assets/images/settings/support.svg',
                  title: 'Support Page',
                  onTap: () {}),
              SizedBox(height: 15),
              SettingsTile(
                  iconPath: 'assets/images/settings/rate.svg',
                  title: 'Rate Us',
                  onTap: () {}),
              SizedBox(height: 15),
              SettingsTile(
                  iconPath: 'assets/images/settings/share.svg',
                  title: 'Share App',
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
