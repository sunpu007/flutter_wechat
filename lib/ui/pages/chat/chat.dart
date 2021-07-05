import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class ChatPage extends StatefulWidget {
  static const String routerName = '/chat';

  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with WidgetsBindingObserver {
  ScrollController _listViewController = ScrollController();

  @override
  initState() {
    super.initState();
    // 默认滚动到最底部
    Timer(Duration(milliseconds: 100), () => _listViewController.jumpTo(_listViewController.position.maxScrollExtent));
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _listViewController.jumpTo(_listViewController.position.maxScrollExtent);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: AppBar(
          title: Text('黑狼传说'),
          actions: [
            IconButton(
              icon: Icon(Icons.more_horiz_outlined),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _listViewController,
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return _buildOtherMessage(context);
                }
                return _buildOwnMessage(context);
              },
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: 151.0.px
            ),
            padding: EdgeInsets.all(21.0.px),
            decoration: BoxDecoration(
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            ),
            child: Row(
              children: [
                Icon(Icons.keyboard_voice, size: 73.0.px,),
                Expanded(
                  child: Container(
                    height: 105.0.px,
                    margin: EdgeInsets.symmetric(horizontal: 29.0.px),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Icon(Icons.emoji_emotions_outlined, size: 73.0.px,),
                SizedBox(width: 35.0.px,),
                Icon(Icons.add_circle_outline, size: 73.0.px,),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOtherMessage(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32.0.px, 0, 32.0.px, 32.0.px),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            child: Image.network(
              'https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg',
              width: 108.0.px,
              height: 108.0.px,
              fit: BoxFit.cover,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 33.0.px, vertical: 20.0.px),
            margin: EdgeInsets.fromLTRB(32.0.px, 0, 0, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.68,
            ),
            child: Text(
              '我通过了你的朋友验证请求，现在我们可以开始聊天了',
              style: TextStyle(
                fontSize: 42.0.px,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOwnMessage(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32.0.px, 0, 32.0.px, 32.0.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 33.0.px, vertical: 20.0.px),
            margin: EdgeInsets.fromLTRB(0, 0, 32.0.px, 0),
            decoration: BoxDecoration(
              color: Color(0xff95ec69),
              borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.68,
            ),
            child: Text(
              '我通过了你的朋友验证请求，现在我们可以开始聊天了',
              style: TextStyle(
                fontSize: 42.0.px,
                height: 1.5,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            child: Image.network(
              'https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg',
              width: 108.0.px,
              height: 108.0.px,
              fit: BoxFit.cover,),
          ),
        ],
      ),
    );
  }
}
