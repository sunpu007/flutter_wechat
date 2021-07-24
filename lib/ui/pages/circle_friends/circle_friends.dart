import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/ui/pages/circle_friends/components/item_context.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/core/services/json_parse.dart';
import 'package:flutter_wechat/core/model/dynamic_model.dart';

class CircleFriends extends StatefulWidget {
  static const String routerName = '/circleFriends';

  const CircleFriends({Key? key}) : super(key: key);

  @override
  _CircleFriendsState createState() => _CircleFriendsState();
}

class _CircleFriendsState extends State<CircleFriends> {
  late ScrollController _controller;

  String title = '';

  List<DynamicModel> _dynamics = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _controller = ScrollController();
    });
    _controller.addListener(() {
      if (_controller.offset >= 854.0.px - AppTheme.appBarHeight) {
        setState(() {
          title = '朋友圈';
        });
      } else {
        setState(() {
          title = '';
        });
      }
    });

    JsonParse.getDynamicData().then((res) {
      setState(() {
        _dynamics = res;
      });
    });
  }

  @override
  void dispose() {
    //销毁控制器
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 854.0.px,
              toolbarHeight: AppTheme.appBarHeight,
              title: title != '' ? Text(title) : null,
              iconTheme: Theme.of(context).appBarTheme.iconTheme?.copyWith(
                color: title == '' ? Colors.white : null,
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
              ],
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network('https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg', fit: BoxFit.cover,),
              ),
            ),
          ];
        },
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: Colors.white,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 237.0.px),
                itemCount: _dynamics.length,
                itemBuilder: (ctx, index) {
                  return ItemContext(
                    dynamic: _dynamics[index],
                  );
                },
              ),
            ),
            Positioned(
              right: 47.0.px,
              top: -100.0.px,
              child: Image.network('https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg', width: 170.0.px, height: 170.0.px,fit: BoxFit.cover,)
            ),
          ],
        ),
      ),
      // CustomScrollView(
      //   controller: _controller,
      //   slivers: <Widget>[
      //     SliverAppBar(
      //       expandedHeight: 854.0.px,
      //       toolbarHeight: AppTheme.appBarHeight,
      //       title: title != '' ? Text(title) : null,
      //       iconTheme: Theme.of(context).appBarTheme.iconTheme?.copyWith(
      //         color: title == '' ? Colors.white : null,
      //       ),
      //       actions: [
      //         IconButton(
      //           icon: Icon(Icons.camera_alt),
      //           onPressed: () {},
      //         ),
      //       ],
      //       pinned: true,
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: Image.network('https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg', fit: BoxFit.cover,),
      //       )
      //     ),
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //         (ctx, int index) {
      //           return Container(
      //             alignment: Alignment.center,
      //             width: 100,
      //             height: 60,
      //             child: Text('111'),
      //           );
      //         },
      //         childCount: 30,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
