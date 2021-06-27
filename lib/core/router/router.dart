import 'package:flutter_wechat/ui/pages/main/main.dart';

class AppRouter {

  static final String initialRoute = MainPage.routerName;

  static final routers = {
    MainPage.routerName: (ctx) => MainPage(),
  };
}