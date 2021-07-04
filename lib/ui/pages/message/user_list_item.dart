import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/pages/chat/chat.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // padding: EdgeInsets.all(43.0.px),
            padding: EdgeInsets.symmetric(
              vertical: 32.0.px,
              horizontal: 43.0.px,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
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
              height: 194.0.px,
              padding: EdgeInsets.fromLTRB(0, 32.0.px, 43.0.px, 32.0.px),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).dividerColor,
                        width: 1.0.px,
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).pushNamed(ChatPage.routerName);
      },
    );
  }
}
