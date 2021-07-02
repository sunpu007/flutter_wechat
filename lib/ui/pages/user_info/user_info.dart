import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/model/user_info_model.dart';
import 'package:flutter_wechat/ui/components/list_nav_item.dart';
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
                  width: 1.0.px,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
          _buildItemContainer([
            ListNavItem(
              title: '设置备注和标签',
            ),
            ListNavItem(
              title: '朋友圈权限',
              isShowBottomBorder: false,
            ),
          ]),
          _buildItemContainer([
            ListNavItem(
              title: '朋友圈',
              height: 216.0.px,
              child: Row(
                children: [
                  Image.network(userInfo.avatarUrl, height: 130.0.px, width: 130.0.px, fit: BoxFit.cover,)
                ],
              ),
            ),
            ListNavItem(
              title: '更多信息',
              isShowBottomBorder: false,
            ),
          ]),
          _buildItemContainer([
            _buildButton(context, Icons.messenger, '发消息'),
            _buildButton(context, Icons.videocam_outlined, '音视频通话', isShowBorder: false),
          ]),
        ],
      ),
    );
  }

  Widget _buildItemContainer(List<Widget> child) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(
        bottom: 22.0.px,
      ),
      child: Column(
        children: [
          ...child,
        ],
      ),
    );
  }

  Widget _buildButton(context, IconData icon, String title, { bool isShowBorder = true }) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 150.0.px,
      shape: isShowBorder ? Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 1.0.px,
        )
      ) : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 49.0.px,
            color: Color(0xff586b96),
          ),
          SizedBox(width: 30.0.px,),
          Text(
            title,
            style: TextStyle(
              fontSize: 42.0.px,
              color: Color(0xff586b96),
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
