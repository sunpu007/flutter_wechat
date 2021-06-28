import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/components/main_appbar.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class AddressBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: MainAppBarComponent('通讯录'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          _buildContactPerson(
              context,
              Image.network(
                'https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg',
                width: 130.0.px,
                height: 130.0.px,
                fit: BoxFit.cover,
              ),
              '黑狼传说'
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 43.0.px),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                )
              )
            ),
            child: SizedBox(
              height: 85.0.px,
              child: Text('我的企业及企业联系人', style: TextStyle(color: Color(0xff767676)),)
            ),
          ),
          _buildContactPerson(
            context,
            Image.network(
              'https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg',
              width: 130.0.px,
              height: 130.0.px,
              fit: BoxFit.cover,
            ),
            '黑狼传说'
          ),
        ],
      ),
    );
  }
  Widget _buildContactPerson(BuildContext context, Widget icon, String title) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 32.0.px,
            horizontal: 43.0.px,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0.px),
            child: icon,
          ),
        ),
        Expanded(
          child: Container(
            height: 172.0.px,
            padding: EdgeInsets.fromLTRB(0, 32.0.px, 43.0.px, 32.0.px),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                    )
                )
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 44.0.px,
              ),
            ),
          ),
        )
      ],
    );
  }
}
