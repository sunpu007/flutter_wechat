import 'package:flutter/material.dart';

import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/ui/components/main_appbar.dart';
import 'package:flutter_wechat/ui/pages/message/user_list_item.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: MainAppBarComponent('微信'),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return UserListItem();
        },
      ),
    );
  }
}
