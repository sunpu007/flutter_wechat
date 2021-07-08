import 'package:flutter_wechat/ui/pages/chat/chat.dart';
import 'package:flutter_wechat/ui/pages/circle_friends/circle_friends.dart';
import 'package:flutter_wechat/ui/pages/login/login.dart';
import 'package:flutter_wechat/ui/pages/main/main.dart';
import 'package:flutter_wechat/ui/pages/user_info/user_info.dart';

class AppRouter {

  static final String initialRoute = MainPage.routerName;
  // static final String initialRoute = LoginPage.routerName;

  static final routers = {
    LoginPage.routerName: (ctx) => LoginPage(),
    MainPage.routerName: (ctx) => MainPage(),
    CircleFriends.routerName: (ctx) => CircleFriends(),
    UserInfoPage.routerName: (ctx) => UserInfoPage(),
    ChatPage.routerName: (ctx) => ChatPage(),
  };
}