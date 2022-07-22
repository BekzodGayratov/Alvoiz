import 'package:flutter/material.dart';

class AlvoizThemeConfig {
  static Color primaryColor = const Color(0xff165376);
  static Color secondaryColor = const Color(0xff93C3DF);
  static Color iconColor = Colors.white;

  static ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: primaryColor, elevation: 0.0),
    scaffoldBackgroundColor: secondaryColor,
  );
}
