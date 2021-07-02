import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class Classification extends StatelessWidget {
  final String title;

  const Classification({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85.0.px,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 43.0.px),
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1.0.px,
                )
            )
        ),
        child: Text(
          title,
          style: TextStyle(color: Color(0xff767676)),
        )
    );
  }
}
