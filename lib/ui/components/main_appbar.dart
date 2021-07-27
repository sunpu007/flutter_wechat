import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/ui/pages/web_view/web_view.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class MainAppBarComponent extends StatelessWidget {
  final String _title;

  MainAppBarComponent(this._title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double popupMenuItemHeight = 100.0.px;
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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0.px)
          ),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
                value: '发起群聊',
                height: popupMenuItemHeight,
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.messenger),
                    Text('发起群聊'),
                  ],
                )
            ),
            PopupMenuDivider(),
            PopupMenuItem(
                value: '添加朋友',
                height: popupMenuItemHeight,
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.person_add_alt_1),
                    Text('添加朋友'),
                  ],
                )
            ),
            PopupMenuDivider(),
            PopupMenuItem(
                value: '扫一扫',
                height: popupMenuItemHeight,
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.qr_code_scanner),
                    Text('扫一扫'),
                  ],
                )
            ),
            PopupMenuDivider(),
            PopupMenuItem(
                value: '收付款',
                height: popupMenuItemHeight,
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.paid),
                    Text('收付款'),
                  ],
                )
            ),
            PopupMenuDivider(),
            PopupMenuItem(
                value: '帮助与反馈',
                height: popupMenuItemHeight,
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.email),
                    Text('帮助与反馈'),
                  ],
                )
            ),
          ],
          onSelected: (String value) {
            print(value);
            if (value == '扫一扫') {
              // TODO 调起扫描二维码功能
              _scan(context);
            }
          },
        ),
      ],
    );
  }

  void _scan(BuildContext context) async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    // 判断扫描结果
    if (barcode != null) {
      Navigator.of(context).pushNamed(WebViewPage.routerName, arguments: barcode);
    }
    print('扫描结果$barcode');
  }
}
