import 'package:flutter/material.dart';

import 'palette.dart';

class ThemeApp {
  static final ThemeData light = ThemeData(
      primaryColor: ColorsApp.primaryColor,
      primarySwatch: ColorsApp.primarySwatch,
      disabledColor: Colors.grey,
      cardColor: Colors.white,
      canvasColor: Colors.grey[50],
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColorBrightness: Brightness.light,
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: ColorsApp.primaryColor,
          iconTheme: IconThemeData(color: ColorsApp.appBarIconColor)),
      fontFamily: 'Manrope',
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)));
  static final dark = ThemeData(
      primaryColor: Colors.black,
      primarySwatch: Colors.blue,
      disabledColor: Colors.grey,
      cardColor: Color(0xff191919),
      canvasColor: Colors.grey[50],
      backgroundColor: Color(0xff191919),
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      primaryColorBrightness: Brightness.dark,
      appBarTheme: AppBarTheme(elevation: 0.0),
      fontFamily: 'Manrope',
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)));
}
