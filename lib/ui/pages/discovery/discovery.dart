import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/components/main_appbar.dart';
import 'package:flutter_wechat/ui/pages/discovery/discovery_nav_item.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: MainAppBarComponent('发现'),
      ),
      body: ListView(
        children: [
          _buildItemContainer([
              DiscoveryNavItem(
                title: '朋友圈',
                imagePath: 'assets/images/circle_of_friends.png',
                isShowBottomBorder: false,
              ),
          ]),
          _buildItemContainer([
            DiscoveryNavItem(
              title: '视频号',
              imagePath: 'assets/images/video_icon.png',
              isShowBottomBorder: false,
            ),
          ]),
          _buildItemContainer([
            DiscoveryNavItem(
              title: '扫一扫',
              imagePath: 'assets/images/scan_it_icon.png',
            ),
            DiscoveryNavItem(
              title: '摇一摇',
              imagePath: 'assets/images/shake_icon.png',
              isShowBottomBorder: false,
            ),
          ]),
          _buildItemContainer([
            DiscoveryNavItem(
              title: '看一看',
              imagePath: 'assets/images/take_a_look_icon.png',
            ),
            DiscoveryNavItem(
              title: '搜一搜',
              imagePath: 'assets/images/search_icon.png',
              isShowBottomBorder: false,
            ),
          ]),
          _buildItemContainer([
            DiscoveryNavItem(
              title: '直播与附近',
              imagePath: 'assets/images/live_and_nearby.png',
              isShowBottomBorder: false,
            ),
          ]),
          _buildItemContainer([
            DiscoveryNavItem(
              title: '购物',
              imagePath: 'assets/images/shopping_icon.png',
            ),
            DiscoveryNavItem(
              title: '游戏',
              imagePath: 'assets/images/game_icon.png',
              isShowBottomBorder: false,
            ),
          ]),
          _buildItemContainer([
            DiscoveryNavItem(
              title: '小程序',
              imagePath: 'assets/images/applets_icon.png',
              isShowBottomBorder: false,
            ),
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
}
