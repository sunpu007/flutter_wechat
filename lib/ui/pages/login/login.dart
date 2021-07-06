import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String routerName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('login'),
      ),
    );
  }
}
