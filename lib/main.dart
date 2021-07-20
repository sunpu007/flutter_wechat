import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_wechat/core/router/router.dart';
import 'package:flutter_wechat/core/viewmodel/app_view_model.dart';
import 'package:flutter_wechat/core/viewmodel/user_view_model.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/ui/shared/screen_fit.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserViewModel()),
      ChangeNotifierProvider(create: (_) => AppViewModel()),
    ],
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化适配器
    ScreenFit.initialize(standardWidth: 1080.0);

    return Consumer<AppViewModel>(
      builder: (ctx, appVm, child) {
        return MaterialApp(
          title: 'Flutter微信',
          // 取消debug图标
          debugShowCheckedModeBanner: false,
          theme: AppTheme.norTheme,
          routes: AppRouter.routers,
          initialRoute: AppRouter.initialRoute,
          supportedLocales: S.delegate.supportedLocales,
          locale: appVm.languageCode.isEmpty ? null : Locale(appVm.languageCode),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            S.delegate,
          ],
        );
      },
    );
  }
}
