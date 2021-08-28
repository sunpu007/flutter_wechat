import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/generated/l10n.dart';
import 'package:flutter_wechat/ui/pages/index/register/register.dart';
import 'package:flutter_wechat/ui/pages/language/Language.dart';
import 'package:flutter_wechat/ui/pages/main/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login/login.dart';

class IndexPage extends StatefulWidget {
  static const String routerName = '/index';

  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool showLoginBtn = false;

  @override
  void initState() {
    super.initState();
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle.light;
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    SharedPreferences.getInstance().then((prefs) {
      String token = (prefs.getString('token') != null ? prefs.getString('token') : '')!;
      // 判断用户是否登录
      if (token.isEmpty) {
        setState(() {
          showLoginBtn = true;
          });
      } else {
        Navigator.pushNamedAndRemoveUntil(context, MainPage.routerName, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/launch_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ..._buildBtnWidget(),
        ],
      ),
    );
  }

  List<Widget> _buildBtnWidget() {
    List<Widget> child = [];
    if (showLoginBtn) {
      child.addAll([
        Positioned(
          top: 140.0.px,
          right: 44.0.px,
          child: GestureDetector(
            child: Text(S.of(context).language, style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.of(context).pushNamed(LanguagePage.routerName);
            },
          ),
        ),
        Positioned(
          left: 57.0.px,
          bottom: 54.0.px,
          child: MaterialButton(
            minWidth: 332.0.px,
            height: 130.0.px,
            color: Color(0xff07c160),
            textColor: Colors.white,
            child: Text(S.of(context).loginBtn, style: TextStyle(fontSize: 44.0.px),),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LoginPage();
                  }
              );
            },
          ),
        ),
        Positioned(
          right: 57.0.px,
          bottom: 54.0.px,
          child: MaterialButton(
            minWidth: 332.0.px,
            height: 130.0.px,
            color: Colors.white,
            textColor: Color(0xff07c160),
            child: Text(S.of(context).registerBtn, style: TextStyle(fontSize: 44.0.px),),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return RegisterPage();
                  }
              );
            },
          ),
        ),
      ]);
    }
    return child;
  }
}
