import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/model/user_info_model.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class UserInfoPage extends StatelessWidget {
  static const String routerName = '/userInfo';

  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfo = ModalRoute.of(context)!.settings.arguments as UserInfoModel;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(43.0.px, 43.0.px, 43.0.px, 60.0.px),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                )
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
                  child: Image.network(userInfo.avatarUrl, width: 173.0.px, height: 173.0.px, fit: BoxFit.cover,)
                ),
                SizedBox(width: 59.0.px,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          userInfo.name,
                          style: TextStyle(
                            fontSize: 48.0.px,
                            fontWeight: FontWeight.bold,
                            height: 1.4
                          ),
                        ),
                        Icon(Icons.female, color: Color(0xff2781d7), size: 48.0.px,)
                      ],
                    ),
                    Text('微信号：${userInfo.openId}', style: TextStyle(fontSize: 38.0.px, height: 1.8, color: Color(0xff7f7f7f),),),
                    Text('地区：${userInfo.province} ${userInfo.city}', style: TextStyle(fontSize: 38.0.px, height: 1.8, color: Color(0xff7f7f7f),),),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
