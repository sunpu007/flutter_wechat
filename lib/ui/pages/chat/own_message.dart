import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class OwnMessage extends StatelessWidget {
  const OwnMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32.0.px, 0, 32.0.px, 32.0.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
