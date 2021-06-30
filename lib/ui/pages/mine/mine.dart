import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Text('我的')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
