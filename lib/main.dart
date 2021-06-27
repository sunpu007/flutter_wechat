import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/router/router.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/ui/shared/screen_fit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化适配器
    ScreenFit.initialize(standardWidth: 1080.0);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.norTheme,
      routes: AppRouter.routers,
      initialRoute: AppRouter.initialRoute,
    );
  }
}
