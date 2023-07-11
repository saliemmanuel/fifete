import 'package:flutter/material.dart';

class ColorsApp {
  static const int primary = 0xFF90B741;
  static MaterialColor primarySwatch = MaterialColor(primary, <int, Color>{
    50: Colors.green,
    100: Colors.green,
    200: Colors.green,
    300: Colors.green,
    400: Colors.green,
    500: Colors.green,
    600: Colors.green,
    700: Colors.green,
    800: Colors.green,
    900: Colors.green,
  });
  static Color primaryColor = Colors.green;
  static Color accentColor = Color(0xff4fc3f7);
  static Color secondaryColor = Colors.black;

  static Color gradientStartColor = accentColor;
  static Color gradientEndColor = Color(0xff6aa8fd);
  static Color errorGradientStartColor = Color(0xffd50000);
  static Color errorGradientEndColor = Color(0xff9b0000);

  static Color primaryTextColorLight = Colors.white;
  static Color secondaryTextColorLight = Colors.white70;
  static Color hintTextColorLight = Colors.white70;

  static Color chipBackgroungColor = Colors.green.withOpacity(0.5);
  static Color appBarIconColor = Colors.white;

  static Color greyColor = Colors.grey;
  static Color bgTextFieldLogin = Color(0xFF919191);
}
