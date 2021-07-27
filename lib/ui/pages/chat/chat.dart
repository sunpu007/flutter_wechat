import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/pages/chat/bottom_context.dart';
import 'package:flutter_wechat/ui/pages/chat/other_message.dart';
import 'package:flutter_wechat/ui/pages/chat/own_message.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';

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
    Timer(Duration(milliseconds: 100), listViewJumpToBottom);
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      listViewJumpToBottom();
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  void listViewJumpToBottom() {
    setState(() {
      _listViewController.jumpTo(_listViewController.position.maxScrollExtent);
    });
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
                  return OtherMessage();
                }
                return OwnMessage();
              },
            ),
          ),
          BottomContext(
            listeningHeight: listViewJumpToBottom,
          ),
        ],
      ),
    );
  }

}
