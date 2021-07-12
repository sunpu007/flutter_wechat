import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/router/router.dart';
import 'package:flutter_wechat/core/viewmodel/user_view_model.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/ui/shared/screen_fit.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserViewModel()),
    ],
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化适配器
    ScreenFit.initialize(standardWidth: 1080.0);

    return MaterialApp(
      title: 'Flutter微信',
      // 取消debug图标
      debugShowCheckedModeBanner: false,
      theme: AppTheme.norTheme,
      routes: AppRouter.routers,
      initialRoute: AppRouter.initialRoute,
    );
  }
}
