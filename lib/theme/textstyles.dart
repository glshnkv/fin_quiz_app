import 'package:flutter/material.dart';

abstract class AppTextStyles {

  static TextStyle h1(Color color) {
    return TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle h2(Color color) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle h3(Color color) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle text(Color color) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle button(Color color) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle text2(Color color) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }
}