import 'package:flutter/material.dart';

import 'package:flutter_wechat/core/extension/double_extension.dart';

class ListNavItem extends StatelessWidget {
  final String title;
  final Widget? leading;
  final String? imagePath;
  final bool isShowBottomBorder;
  final bool isShowRightIcon;
  final String? jumpPath;
  final Widget? child;

  const ListNavItem({
    Key? key,
    required this.title,
    this.leading,
    this.imagePath,
    this.isShowBottomBorder = true,
    this.isShowRightIcon = true,
    this.jumpPath,
    this.child,
  }) : assert(leading != null || imagePath != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 45.0.px, horizontal: 49.0.px),
            child: leading != null ? this.leading : Image.asset(imagePath!, width: 60.0.px, height: 60.0.px, fit: BoxFit.cover,),
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
                      child: child,
                    ),
                  ),
                  Icon(isShowRightIcon ? Icons.chevron_right : null, color: Color(0xffb2b2b2),),
                ],
              ),
            ),
          )
        ],
      ),
      onTap: () {
        if (jumpPath != '') {
          Navigator.of(context).pushNamed(jumpPath!);
        }
      },
    );
  }
}
