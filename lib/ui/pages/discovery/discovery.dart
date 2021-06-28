import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/components/main_appbar.dart';
import 'package:flutter_wechat/ui/pages/circle_friends/circle_friends.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: MainAppBarComponent('发现'),
      ),
      body: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(CircleFriends.routerName);
        },
      ),
    );
  }
}
