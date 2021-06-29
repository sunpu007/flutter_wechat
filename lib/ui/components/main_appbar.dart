import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';

class MainAppBarComponent extends StatelessWidget {
  final String _title;

  MainAppBarComponent(this._title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
      actions: [
        IconButton(
          icon: Icon(Icons.search_outlined),
          onPressed: () {
            print('search_outlined');
          },
        ),
        PopupMenuButton<String>(
          icon: Icon(Icons.add_circle_outline),
          offset: Offset(0, AppTheme.appBarHeight),
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
    );
  }
}
