import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/components/main_appbar.dart';
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
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              bottom: 22.0.px,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 45.0.px, horizontal: 49.0.px),
                  child: Image.asset('assets/images/circle_of_friends.png', width: 60.0.px, height: 60.0.px,),
                ),
                Expanded(
                  child: Container(
                    height: 150.0.px,
                    padding: EdgeInsets.fromLTRB(0, 0, 49.0.px, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('朋友圈', style: TextStyle(fontSize: 44.0.px),),
                        Icon(Icons.chevron_right, color: Color(0xffb2b2b2),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              bottom: 22.0.px,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 45.0.px, horizontal: 49.0.px),
                  child: Image.asset('assets/images/circle_of_friends.png', width: 60.0.px, height: 60.0.px,),
                ),
                Expanded(
                  child: Container(
                    height: 150.0.px,
                    padding: EdgeInsets.fromLTRB(0, 0, 49.0.px, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('视频号', style: TextStyle(fontSize: 44.0.px),),
                        Icon(Icons.chevron_right, color: Color(0xffb2b2b2),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              bottom: 22.0.px,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 45.0.px, horizontal: 49.0.px),
                      child: Image.asset('assets/images/circle_of_friends.png', width: 60.0.px, height: 60.0.px,),
                    ),
                    Expanded(
                      child: Container(
                        height: 150.0.px,
                        padding: EdgeInsets.fromLTRB(0, 0, 49.0.px, 0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('扫一扫', style: TextStyle(fontSize: 44.0.px),),
                            Icon(Icons.chevron_right, color: Color(0xffb2b2b2),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 45.0.px, horizontal: 49.0.px),
                      child: Image.asset('assets/images/circle_of_friends.png', width: 60.0.px, height: 60.0.px,),
                    ),
                    Expanded(
                      child: Container(
                        height: 150.0.px,
                        padding: EdgeInsets.fromLTRB(0, 0, 49.0.px, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('摇一摇', style: TextStyle(fontSize: 44.0.px),),
                            Icon(Icons.chevron_right, color: Color(0xffb2b2b2),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              bottom: 22.0.px,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 45.0.px, horizontal: 49.0.px),
                      child: Image.asset('assets/images/circle_of_friends.png', width: 60.0.px, height: 60.0.px,),
                    ),
                    Expanded(
                      child: Container(
                        height: 150.0.px,
                        padding: EdgeInsets.fromLTRB(0, 0, 49.0.px, 0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('看一看', style: TextStyle(fontSize: 44.0.px),),
                            Icon(Icons.chevron_right, color: Color(0xffb2b2b2),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 45.0.px, horizontal: 49.0.px),
                      child: Image.asset('assets/images/circle_of_friends.png', width: 60.0.px, height: 60.0.px,),
                    ),
                    Expanded(
                      child: Container(
                        height: 150.0.px,
                        padding: EdgeInsets.fromLTRB(0, 0, 49.0.px, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('搜一搜', style: TextStyle(fontSize: 44.0.px),),
                            Icon(Icons.chevron_right, color: Color(0xffb2b2b2),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              bottom: 22.0.px,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 45.0.px, horizontal: 49.0.px),
                  child: Image.asset('assets/images/circle_of_friends.png', width: 60.0.px, height: 60.0.px,),
                ),
                Expanded(
                  child: Container(
                    height: 150.0.px,
                    padding: EdgeInsets.fromLTRB(0, 0, 49.0.px, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('直播与附近', style: TextStyle(fontSize: 44.0.px),),
                        Icon(Icons.chevron_right, color: Color(0xffb2b2b2),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              bottom: 22.0.px,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 45.0.px, horizontal: 49.0.px),
                      child: Image.asset('assets/images/circle_of_friends.png', width: 60.0.px, height: 60.0.px,),
                    ),
                    Expanded(
                      child: Container(
                        height: 150.0.px,
                        padding: EdgeInsets.fromLTRB(0, 0, 49.0.px, 0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('购物', style: TextStyle(fontSize: 44.0.px),),
                            Icon(Icons.chevron_right, color: Color(0xffb2b2b2),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 45.0.px, horizontal: 49.0.px),
                      child: Image.asset('assets/images/circle_of_friends.png', width: 60.0.px, height: 60.0.px,),
                    ),
                    Expanded(
                      child: Container(
                        height: 150.0.px,
                        padding: EdgeInsets.fromLTRB(0, 0, 49.0.px, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('游戏', style: TextStyle(fontSize: 44.0.px),),
                            Icon(Icons.chevron_right, color: Color(0xffb2b2b2),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              bottom: 22.0.px,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 45.0.px, horizontal: 49.0.px),
                  child: Image.asset('assets/images/circle_of_friends.png', width: 60.0.px, height: 60.0.px,),
                ),
                Expanded(
                  child: Container(
                    height: 150.0.px,
                    padding: EdgeInsets.fromLTRB(0, 0, 49.0.px, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('小程序', style: TextStyle(fontSize: 44.0.px),),
                        Icon(Icons.chevron_right, color: Color(0xffb2b2b2),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
