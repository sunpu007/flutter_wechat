import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/core/viewmodel/user_view_model.dart';
import 'package:flutter_wechat/ui/pages/main/main.dart';
import 'package:provider/provider.dart';

import 'login/login.dart';

class IndexPage extends StatefulWidget {
  static const String routerName = '/index';

  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool showLoginBtn = false;

  Timer? mainTimer;
  Timer? navTimer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mainTimer!.cancel();
    navTimer!.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    this.context.dependOnInheritedWidgetOfExactType();
    super.didChangeDependencies();
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
          Consumer<UserViewModel>(
            builder: (ctx, userVM, child) {
              mainTimer = Timer(Duration(seconds: 1), () {
                if (userVM.token.isNotEmpty) {
                  navTimer = Timer(Duration(seconds: 1), () {
                    navTimer!.cancel();
                    Navigator.pushNamedAndRemoveUntil(context, MainPage.routerName, (route) => false);
                  });
                } else {
                  if (mounted) {
                    setState(() {
                      showLoginBtn = true;
                    });
                  }
                }
                mainTimer!.cancel();
              });
              return Container();
            }
          ),
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
          child: Text('语言', style: TextStyle(color: Colors.white),),
        ),
        Positioned(
          left: 57.0.px,
          bottom: 54.0.px,
          child: MaterialButton(
            minWidth: 332.0.px,
            height: 130.0.px,
            color: Color(0xff07c160),
            textColor: Colors.white,
            child: Text('登录', style: TextStyle(fontSize: 44.0.px),),
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
            child: Text('注册', style: TextStyle(fontSize: 44.0.px),),
            onPressed: () {
              print('跳转注册');
            },
          ),
        ),
      ]);
    }
    return child;
  }
}
