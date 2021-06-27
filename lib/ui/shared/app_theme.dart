import 'package:flutter/material.dart';

class AppTheme {

  // 2.普通模式
  static final ThemeData norTheme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent, primarySwatch: createMaterialColor(Color(0xff39B231)),
  );


  // 3.暗黑模式
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
  );
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}