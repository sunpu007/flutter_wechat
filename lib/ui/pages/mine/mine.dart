import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/core/viewmodel/user_view_model.dart';
import 'package:flutter_wechat/ui/components/list_nav_item.dart';
import 'package:flutter_wechat/ui/pages/index/index.dart';
import 'package:flutter_wechat/ui/pages/websocket/websocket.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:provider/provider.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(65.0.px, 130.0.px, 45.0.px, 65.0.px),
              color: Colors.white,
              margin: EdgeInsets.only(
                bottom: 22.0.px,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
                    child: Image.network(
                      'https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg',
                      width: 173.0.px,
                      height: 173.0.px,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 47.0.px,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('黑狼传说', style: TextStyle(fontSize: 44.0.px, fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 30.0.px,
                        ),
                        Row(
                          children: [
                            Text(
                              '微信号：',
                              style: TextStyle(
                                fontSize: 34.0.px,
                                color: Color(0xffb2b2b2),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'wxid_jdgn3sjky4e12dnmhdn345mk',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 34.0.px,
                                  color: Color(0xffb2b2b2),
                                ),
                              ),
                            ),
                            SizedBox(width: 70.0.px,),
                            Icon(Icons.qr_code_2, size: 33.0.px, color: Color(0xffb2b2b2),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Color(0xffb2b2b2))
                ],
              ),
            ),
            _buildItemContainer([
              ListNavItem(
                title: '支付',
                imagePath: 'assets/images/wechat_pay.png',
                isShowBottomBorder: false,
              ),
            ]),
            _buildItemContainer([
              ListNavItem(
                title: '收藏',
                imagePath: 'assets/images/favorites_icon.png',
              ),
              ListNavItem(
                title: '朋友圈',
                leading: Icon(Icons.insert_photo_outlined, color: Color(0xff2781d7), size: 60.0.px,),
              ),
              ListNavItem(
                title: '卡包',
                leading: Icon(Icons.credit_card_outlined, color: Color(0xff2781d7), size: 60.0.px,),
              ),
              ListNavItem(
                title: '表情',
                leading: Icon(Icons.emoji_emotions_outlined, color: Color(0xfffa9e3b), size: 60.0.px,),
                isShowBottomBorder: false,
              ),
            ]),
            _buildItemContainer([
              ListNavItem(
                title: '设置',
                leading: Icon(Icons.settings_outlined, color: Color(0xff2781d7), size: 60.0.px,),
                isShowBottomBorder: false,
              ),
            ]),
            _buildItemContainer([
              ListNavItem(
                title: '测试websocket',
                leading: Icon(Icons.connect_without_contact_outlined, color: Color(0xff2781d7), size: 60.0.px,),
                isShowBottomBorder: false,
                jumpPath: WebSocketPage.routerName,
              ),
            ]),
            _buildItemContainer([
              Consumer<UserViewModel>(
                builder: (context, userVM, child) {
                  return ListNavItem(
                    title: '退出',
                    leading: Icon(Icons.logout, color: Color(0xff2781d7), size: 60.0.px,),
                    isShowBottomBorder: false,
                    onTap: () {
                      userVM.token = '';
                      Navigator.pushNamedAndRemoveUntil(context, IndexPage.routerName, (route) => false);
                    },
                  );
                },
              ),
            ]),
          ],
        ),
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
}
