import 'package:flutter/material.dart';

import 'package:flutter_wechat/core/extension/double_extension.dart';

class ListNavItem extends StatelessWidget {
  final String title;
  final double? height;
  final Widget? leading;
  final String? imagePath;
  final bool isShowBottomBorder;
  final bool isShowRightIcon;
  final String? jumpPath;
  final Widget? child;

  const ListNavItem({
    Key? key,
    required this.title,
    this.height,
    this.leading,
    this.imagePath,
    this.isShowBottomBorder = true,
    this.isShowRightIcon = true,
    this.jumpPath,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.fromLTRB(49.0.px, 0, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildContext(context),
        ),
      ),
      onTap: () {
        if (this.jumpPath != null && this.jumpPath != '') {
          Navigator.of(context).pushNamed(jumpPath!);
        }
      },
    );
  }
  List<Widget> _buildContext(context) {
    List<Widget> child = [];

    if (this.leading != null || this.imagePath != null) {
      child.add(Padding(
        padding: EdgeInsets.fromLTRB(0, 45.0.px, 49.0.px, 45.0.px),
        child: this.leading != null ? this.leading : Image.asset(this.imagePath!, width: 60.0.px, height: 60.0.px, fit: BoxFit.cover,),
      ),);
    }
    child.add(Expanded(
      child: Container(
        height: this.height != null ? this.height : 150.0.px,
        padding: EdgeInsets.fromLTRB(0, 0, 49.0.px, 0),
        decoration: BoxDecoration(
          border: this.isShowBottomBorder ? Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1.0.px,
            ),
          ) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                minWidth: 183.0.px,
              ),
              child: Text(title, style: TextStyle(fontSize: 44.0.px),)
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  left: 55.0.px,
                  right: 20.0.px,
                ),
                alignment: Alignment.centerRight,
                child: this.child,
              ),
            ),
            Icon(this.isShowRightIcon ? Icons.chevron_right : null, color: Color(0xffb2b2b2),),
          ],
        ),
      ),
    ));

    return child;
  }
}
