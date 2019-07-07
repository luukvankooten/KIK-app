import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: CompanyColors.blue,
  primaryColor: CompanyColors.blue[900],
);

class CompanyColors {
  CompanyColors._(); // this basically makes it so you can instantiate this class
  static const Map<int, Color> blue = const <int, Color> {
    50: const Color(0xFF),
    100: const Color(0xFF477ca7),
    200: const Color(0xFF),
    300: const Color(0xFF),
    400: const Color(0xFF),
    500: const Color(0xFF),
    600: const Color(0xFF),
    700: const Color(0xFF),
    800: const Color(0xFF),
    900: const Color(0xFF00284c)
  };
}
