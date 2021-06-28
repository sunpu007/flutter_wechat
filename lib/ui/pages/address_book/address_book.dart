import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/components/main_appbar.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';

class AddressBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: MainAppBarComponent('通讯录'),
      ),
      body: Text('通讯录'),
    );
  }
}
