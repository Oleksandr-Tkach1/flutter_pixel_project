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