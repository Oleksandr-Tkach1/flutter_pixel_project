import 'package:flutter/material.dart';

class CustomColors{
  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF3B4254),
      100: Color(0xFF545D6E),
      200: Color(0xFFA9ABB0),
      300: Color(0xFF2B313F),
      400: Color(0xFF000000),
      500: Color(_blackPrimaryValue),
    },
  );
  static const int _blackPrimaryValue = 0xFF000000;
}

abstract class AppColors {
  static const Color backgroundColor = Color(0xFF3B4254);
  static const Color navigationBackgroundColor = Color(0xFF545D6E);
  static const Color backgroundColorLogin = Color(0xFF2E3034);
  static const Color textFieldColor = Color(0xff2F3135);
  static const Color textColorLogin = Color(0xFF393B3F);

  static const Color buttonColor = Color(0xFFC61919);
  static const Color itemTextColor = Color(0xFF484848);

  static const Color errorTextColor = Color(0xFFF44336);
  static const Color acceptTextColor = Color(0xFF4CAF50);

}