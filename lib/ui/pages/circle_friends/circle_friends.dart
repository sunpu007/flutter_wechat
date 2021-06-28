import 'package:flutter/material.dart';

class CircleFriends extends StatelessWidget {
  static const String routerName = '/circleFriends';

  const CircleFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('朋友圈'),
          )
        ],
      ),
    );
  }
}
