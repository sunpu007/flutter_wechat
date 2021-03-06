import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class AppTheme {

  static final double appBarHeight = 127.0.px;
  static final double defaultBorderRadius = 20.0.px;

  // 1.普通模式
  static final ThemeData norTheme = ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primarySwatch: createMaterialColor(Color(0xff39B231)),
    canvasColor: Color(0xffededed),
    dividerColor: Color(0xffe5e5e5),
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffededed),
      elevation: 0.0,
      centerTitle: true,
      backwardsCompatibility: false,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 44.0.px,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 44.0.px
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xfff7f7f7),
    ),
    popupMenuTheme: PopupMenuThemeData(
      elevation: 0.0,
      color: Color(0xff404040),
      textStyle: TextStyle(
        fontSize: 42.0.px,
        color: Colors.white,
      )
    ),
  );


  // 2.暗黑模式
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primarySwatch: createMaterialColor(Color(0xff07c160)),
    canvasColor: Color(0xff111111),
    dividerColor: Color(0xff252525),
    cardColor: Color(0xff191919),
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff111111),
        elevation: 0.0,
        centerTitle: true,
        backwardsCompatibility: false,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 44.0.px,
          fontWeight: FontWeight.w500,
        ),
        iconTheme: IconThemeData(
            color: Colors.white,
            size: 44.0.px
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xff1e1e1e),
      unselectedItemColor: Color(0xffcccccc),
    ),
    popupMenuTheme: PopupMenuThemeData(
        elevation: 0.0,
        color: Color(0xff404040),
        textStyle: TextStyle(
          fontSize: 42.0.px,
          color: Colors.white,
        )
    ),
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
