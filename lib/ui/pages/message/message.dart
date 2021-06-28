import 'package:flutter/material.dart';

import 'package:flutter_wechat/core/extension/double_extension.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {
              print('search_outlined');
            },
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.add_circle_outline),
            offset: Offset(0, 56.0),
            elevation: 0.0,
            color: Color(0xff4c4c4c),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0.px)
            ),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: '发起群聊',
                child: Wrap(
                  spacing: 10,
                  children: [
                    Icon(Icons.messenger, color: Colors.white,),
                    Text('发起群聊', style: TextStyle(color: Colors.white),),
                  ],
                )
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: '添加朋友',
                child: Wrap(
                  spacing: 10,
                  children: [
                    Icon(Icons.person_add_alt_1, color: Colors.white,),
                    Text('添加朋友', style: TextStyle(color: Colors.white),),
                  ],
                )
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: '扫一扫',
                child: Wrap(
                  spacing: 10,
                  children: [
                    Icon(Icons.qr_code_scanner, color: Colors.white,),
                    Text('扫一扫', style: TextStyle(color: Colors.white),),
                  ],
                )
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: '收付款',
                child: Wrap(
                  spacing: 10,
                  children: [
                    Icon(Icons.paid, color: Colors.white,),
                    Text('收付款', style: TextStyle(color: Colors.white),),
                  ],
                )
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: '帮助与反馈',
                child: Wrap(
                  spacing: 10,
                  children: [
                    Icon(Icons.email, color: Colors.white,),
                    Text('帮助与反馈', style: TextStyle(color: Colors.white),),
                  ],
                )
              ),
            ],
            onSelected: (String value) {
              print(value);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(43.0.px),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0.px),
                  child: Image.network(
                    'https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg',
                    width: 130.0.px,
                    height: 130.0.px,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 216.0.px,
                  padding: EdgeInsets.fromLTRB(0, 43.0.px, 43.0.px, 43.0.px),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffe5e5e5),
                      )
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '黑狼传说',
                            style: TextStyle(
                              fontSize: 44.0.px,
                            ),
                          ),
                          Text(
                            '21:09',
                            style: TextStyle(
                              fontSize: 34.0.px,
                              color: Color(0xffb2b2b2),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '程序员开始开发啦程序员开始开发啦程序员开始开发啦程序员开始开发啦',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 34.0.px,
                                color: Color(0xffb2b2b2),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50.0.px,
                          ),
                          Icon(
                            Icons.notifications_off_outlined,
                            size: 50.0.px,
                            color: Color(0xffb2b2b2),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
