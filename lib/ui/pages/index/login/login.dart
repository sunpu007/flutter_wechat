import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/core/utils/utils.dart';
import 'package:flutter_wechat/core/viewmodel/user_view_model.dart';
import 'package:flutter_wechat/generated/l10n.dart';
import 'package:flutter_wechat/ui/pages/index/components/build_text_field.dart';
import 'package:flutter_wechat/ui/pages/main/main.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String routerName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String mobile = '';
  String password = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(44.0.px, 44.0.px, 44.0.px, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Icon(Icons.close, size: 88.0.px,),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(height: 148.0.px,),
                  Text('手机号登录', style: TextStyle(fontSize: 70.0.px,),),
                  SizedBox(height: 100.0.px,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.px, vertical: 52.0.px),
                    child: Row(
                      children: [
                        Container(
                          width: 275.0.px,
                          child: Text('国家/地区', style: TextStyle(fontSize: 50.0.px),),
                        ),
                        Expanded(
                          child: Text('中国大陆 （+86）', style: TextStyle(fontSize: 50.0.px, color: Color(0xff07c160)),),
                        ),
                      ],
                    ),
                  ),
                  BuildTextField(
                    label: S.of(context).phone,
                    placeholder: '请填写手机号',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (!checkMobile(value!)) return '手机号有误';
                    },
                    onChanged: (value) {
                      setState(() {
                        mobile = value;
                      });
                    },
                  ),
                  BuildTextField(
                    label: '密码',
                    obscureText: true,
                    placeholder: '请填写密码',
                    validator: (value) {
                      if (value!.length < 6) return '密码至少6位';
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 76.0.px),
                    padding: EdgeInsets.symmetric(horizontal: 24.0.px,),
                    child: Text('用微信号/QQ号/邮箱登录', style: TextStyle(color: Color(0xff586b95), fontSize: 44.0.px),),
                  ),
                  SizedBox(height: 117.0.px,),
                  Consumer<UserViewModel>(
                    builder: (ctx, userVM, child) {
                      return  MaterialButton(
                        minWidth: double.infinity,
                        height: 130.0.px,
                        color: (mobile.length > 0 && password.length > 0) ? Color(0xff07c160) : Color(0xffe1e1e1),
                        textColor: (mobile.length > 0 && password.length > 0) ? Colors.white : Color(0xffb4b4b4),
                        elevation: 0,
                        highlightElevation: 0,
                        child: Text(S.of(context).loginBtn, style: TextStyle(fontSize: 44.0.px),),
                        onPressed: () {
                          if ((mobile.length <= 0 && password.length <= 0) || !_formKey.currentState!.validate()) return;
                          userVM.token = '123456';
                          Navigator.pushNamedAndRemoveUntil(context, MainPage.routerName, (route) => false);
                        },
                      );
                    },
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
