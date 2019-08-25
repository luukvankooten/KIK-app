import 'package:flutter/material.dart';

class ThemeColor {
  static const int _bluePrimaryValue = 0xFFF095078;
  
  static const MaterialColor blue =
      MaterialColor(_bluePrimaryValue, <int, Color>{
          50: Color(0xFFE1EAEF),
          100: Color(0xFFB5CBD7),
          200: Color(0xFF84A8BC),
          300: Color(0xFF5385A1),
          400: Color(0xFF2E6A8C),
          500: Color(_bluePrimaryValue),
          600: Color(0xFF084970),
          700: Color(0xFF064065),
          800: Color(0xFF05375B),
          900: Color(0xFF022748),
      });
}
