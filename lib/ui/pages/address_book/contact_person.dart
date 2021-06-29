import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';

class ContactPerson extends StatelessWidget {
  final String title;
  final Widget icon;

  const ContactPerson({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 32.0.px,
            horizontal: 43.0.px,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            child: icon,
          ),
        ),
        Expanded(
          child: Container(
            height: 172.0.px,
            padding: EdgeInsets.fromLTRB(0, 32.0.px, 43.0.px, 32.0.px),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ))),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 44.0.px,
              ),
            ),
          ),
        )
      ],
    );
  }
}
