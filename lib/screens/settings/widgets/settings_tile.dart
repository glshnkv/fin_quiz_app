import 'package:fin_quiz_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final void Function()? onTap;

  const SettingsTile({super.key, required this.iconPath, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.white20,
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              child: SvgPicture.asset(iconPath),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(title, style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.white,
              ),),
            ),
            Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}