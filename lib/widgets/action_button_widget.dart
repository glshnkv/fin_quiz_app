
import 'package:fin_quiz_app/theme/colors.dart';
import 'package:fin_quiz_app/theme/textstyles.dart';
import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final void Function()? onTap;

  const ActionButtonWidget(
      {super.key,
        required this.text,
        required this.width,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: AppColors.blue,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Center(
          child: Text(
              text,
              style: AppTextStyles.button(AppColors.white)
          ),
        ),
      ),
    );
  }
}