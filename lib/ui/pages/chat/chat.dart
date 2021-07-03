import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class ChatPage extends StatelessWidget {
  static const String routerName = '/chat';

  const ChatPage({Key? key}) : super(key: key);

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
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return Text('item');
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
}
