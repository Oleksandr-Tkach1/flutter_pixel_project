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
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
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
  //static const Color textColorLogin = Color(0xFF47494E);

  static const Color buttonColor = Color(0xFFC61919);
  static const Color itemTextColor = Color(0xFF484848);

  static const Color buttonOutline = Color(0xff6671C0);
  static const Color buttonBorderColor = Color(0xff6AA0F7);
  static const Color buttonDisabledTextColor = Color(0xFFcccccc);

  static const Color errorTextColor = Color(0xFFbf3938);
}