import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';

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
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
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
                        Row(
                          children: [
                            Text('微信号：'),
                            Expanded(
                              child: Text('wxid_jdgn3sjky4e12dnmhdn345mk', overflow: TextOverflow.ellipsis,),
                            ),
                            SizedBox(width: 70.0.px,),
                            Icon(Icons.qr_code_2)
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
