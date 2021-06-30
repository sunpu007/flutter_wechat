import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class DiscoveryNavItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isShowBottomBorder;
  const DiscoveryNavItem({Key? key, required this.title, required this.imagePath, this.isShowBottomBorder = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                Icon(Icons.chevron_right, color: Color(0xffb2b2b2),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
