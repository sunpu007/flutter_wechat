import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class LoginPage extends StatelessWidget {
  static const String routerName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 323.0.px, 0, 0),
        padding: EdgeInsets.symmetric(horizontal: 43.0.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network('https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg', width: 216.0.px, height: 216.0.px, fit: BoxFit.cover,),
            SizedBox(height: 35.0.px,),
            Text('13072970180', style: TextStyle(fontSize: 60.0.px),),
            SizedBox(height: 108.0.px,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0.px, vertical: 52.0.px),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xff40a57d),
                    width: 2.0.px
                  )
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 275.0.px,
                    child: Text('密码', style: TextStyle(fontSize: 50.0.px),),
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '请填写微信密码',
                        contentPadding: EdgeInsets.all(0.0),
                        isCollapsed: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 50.0.px,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
