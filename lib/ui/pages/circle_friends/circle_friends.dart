import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: Colors.white,
            child: ListView(
              controller: _controller,
              padding: EdgeInsets.only(top: 0),
              children: [
                Image.network(
                  'https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg',
                  width: double.infinity,
                  height: 850.0.px,
                  fit: BoxFit.cover,
                ),
                _buildUserNameAndAvatar(),
                ...List.generate(_dynamics.length, (index) {
                  return ItemContext(
                    dynamic: _dynamics[index],
                  );
                }),
              ],
            ),
          ),
          /// appBar
          _buildAppBar(context),
        ],
      )
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Positioned(
      child: Container(
        height: AppTheme.appBarHeight + MediaQuery.of(context).padding.top,
        child: PreferredSize(
          preferredSize: Size.fromHeight(AppTheme.appBarHeight),
          child: AppBar(
            backgroundColor: title == '' ? Colors.transparent : null,
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
            systemOverlayStyle: title == '' ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
          ),
        ),
      ),
    );
  }

  Widget _buildUserNameAndAvatar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 237.0.px,
        ),
        Positioned(
          right: 47.0.px,
          top: -100.0.px,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.0.px),
                child: Text(
                  '黑狼传说',
                  style: TextStyle(
                    fontSize: 44.0.px,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 24.0.px,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0.px),
                child: Image.network(
                  'https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg',
                  width: 174.0.px,
                  height: 174.0.px,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
