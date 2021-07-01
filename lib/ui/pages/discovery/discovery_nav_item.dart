import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';

class DiscoveryNavItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isShowBottomBorder;
  final String jumpPath;
  const DiscoveryNavItem({Key? key, required this.title, required this.imagePath, this.isShowBottomBorder = true, this.jumpPath = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 45.0.px, horizontal: 49.0.px),
            child: Image.asset(imagePath, width: 60.0.px, height: 60.0.px,),
          ),
          Expanded(
            child: Container(
              height: 150.0.px,
              padding: EdgeInsets.fromLTRB(0, 0, 49.0.px, 0),
              decoration: BoxDecoration(
                border: isShowBottomBorder ? Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ) : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(fontSize: 44.0.px),),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 20.0.px, 0),
                      alignment: Alignment.centerRight,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius * 0.4),
                            child: Image.network(
                              'https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg',
                              width: 86.0.px,
                              height: 86.0.px,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: -15.0.px,
                            right: -15.0.px,
                            child: Container(
                              height: 30.0.px,
                              width: 30.0.px,
                              decoration: BoxDecoration(
                                color: Color(0xfffa5251),
                                borderRadius: BorderRadius.circular(30.0.px),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Color(0xffb2b2b2),)
                ],
              ),
            ),
          )
        ],
      ),
      onTap: () {
        if (jumpPath != '') {
          Navigator.of(context).pushNamed(jumpPath);
        }
      },
    );
  }
}
