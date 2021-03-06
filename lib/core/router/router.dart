import 'package:flutter_wechat/ui/pages/chat/chat.dart';
import 'package:flutter_wechat/ui/pages/circle_friends/circle_friends.dart';
import 'package:flutter_wechat/ui/pages/index/index.dart';
import 'package:flutter_wechat/ui/pages/language/Language.dart';
import 'package:flutter_wechat/ui/pages/main/main.dart';
import 'package:flutter_wechat/ui/pages/user_info/user_info.dart';
import 'package:flutter_wechat/ui/pages/web_view/web_view.dart';
import 'package:flutter_wechat/ui/pages/websocket/websocket.dart';

class AppRouter {

  // static final String initialRoute = WebViewPage.routerName;
  static final String initialRoute = IndexPage.routerName;

  static final routers = {
    IndexPage.routerName: (ctx) => IndexPage(),
    MainPage.routerName: (ctx) => MainPage(),
    CircleFriends.routerName: (ctx) => CircleFriends(),
    UserInfoPage.routerName: (ctx) => UserInfoPage(),
    ChatPage.routerName: (ctx) => ChatPage(),
    WebSocketPage.routerName: (ctx) => WebSocketPage(),
    LanguagePage.routerName: (ctx) => LanguagePage(),
    WebViewPage.routerName: (ctx) => WebViewPage(),
  };
}