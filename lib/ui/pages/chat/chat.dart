import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/model/emoji_model.dart';
import 'package:flutter_wechat/core/services/json_parse.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class ChatPage extends StatefulWidget {
  static const String routerName = '/chat';

  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with WidgetsBindingObserver {
  ScrollController _listViewController = ScrollController();

  String _value = '';
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _commentFocus = FocusNode();

  bool _isShowEmoji = false;

  List<EmojiModel> _emojis = [];

  @override
  initState() {
    super.initState();
    // 默认滚动到最底部
    Timer(Duration(milliseconds: 100), () => _listViewController.jumpTo(_listViewController.position.maxScrollExtent));
    WidgetsBinding.instance!.addObserver(this);

    JsonParse.getEmojiData().then((value) {
      setState(() {
        _emojis = value;
      });
    });
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _listViewController.jumpTo(_listViewController.position.maxScrollExtent);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: AppBar(
          title: Text('黑狼传说'),
          actions: [
            IconButton(
              icon: Icon(Icons.more_horiz_outlined),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _listViewController,
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return _buildOtherMessage(context);
                }
                return _buildOwnMessage(context);
              },
            ),
          ),
          _buildBottomContext(context),
        ],
      ),
    );
  }

  Widget _buildOtherMessage(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32.0.px, 0, 32.0.px, 32.0.px),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            child: Image.network(
              'https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg',
              width: 108.0.px,
              height: 108.0.px,
              fit: BoxFit.cover,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 33.0.px, vertical: 20.0.px),
            margin: EdgeInsets.fromLTRB(32.0.px, 0, 0, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.68,
            ),
            child: Text(
              '我通过了你的朋友验证请求，现在我们可以开始聊天了',
              style: TextStyle(
                fontSize: 42.0.px,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOwnMessage(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32.0.px, 0, 32.0.px, 32.0.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 33.0.px, vertical: 20.0.px),
            margin: EdgeInsets.fromLTRB(0, 0, 32.0.px, 0),
            decoration: BoxDecoration(
              color: Color(0xff95ec69),
              borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.68,
            ),
            child: Text(
              '我通过了你的朋友验证请求，现在我们可以开始聊天了',
              style: TextStyle(
                fontSize: 42.0.px,
                height: 1.5,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
            child: Image.network(
              'https://oss-blog.myjerry.cn/avatar/blog-avatar.jpg',
              width: 108.0.px,
              height: 108.0.px,
              fit: BoxFit.cover,),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomContext(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(21.0.px),
          constraints: BoxConstraints(
              minHeight: 151.0.px
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 74.0.px,
                height: 105.0.px,
                alignment: Alignment.center,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    Icons.keyboard_voice,
                    size: 73.0.px,
                  ),
                  onPressed: () {},
                ),
              ),
              _buildInputWidget(),
              Container(
                width: 74.0.px,
                height: 105.0.px,
                alignment: Alignment.center,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    _isShowEmoji ? Icons.keyboard_alt_outlined : Icons.emoji_emotions_outlined,
                    size: 73.0.px,
                  ),
                  onPressed: () {
                    setState(() {
                      _isShowEmoji = !_isShowEmoji;
                    });
                    if (!_isShowEmoji) {
                      FocusScope.of(context).requestFocus(_commentFocus);
                    } else {
                      _commentFocus.unfocus();
                    }
                    Timer(Duration(milliseconds: 100), () => _listViewController.jumpTo(_listViewController.position.maxScrollExtent));
                  },
                ),
              ),
              SizedBox(width: 35.0.px,),
              _value.isEmpty ? Container(
                width: 74.0.px,
                height: 105.0.px,
                alignment: Alignment.center,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.add_circle_outline, size: 73.0.px,),
                  onPressed: () {},
                ),
              ) : Container(
                width: 162.0.px,
                height: 86.0.px,
                margin: EdgeInsets.only(bottom: 10.0.px),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff07c160),
                  borderRadius: BorderRadius.circular(10.0.px),
                ),
                child: Text(
                  '发送',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42.0.px
                  ),
                ),
              ),
            ],
          ),
        ),
        // 表情
        _isShowEmoji ? _buildEmojiWidget() : Container(),
      ],
    );
  }

  Widget _buildInputWidget() {
    return Expanded(
      child: Container(
        // min-height: 105.0.px,
        constraints: BoxConstraints(
          minHeight: 105.0.px,
          maxHeight: 282.0.px,
        ),
        margin: EdgeInsets.symmetric(horizontal: 29.0.px),
        padding: EdgeInsets.symmetric(vertical: 23.0.px, horizontal: 23.0.px),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppTheme.defaultBorderRadius),
        ),
        child: TextField(
          controller: _textEditingController,
          focusNode: _commentFocus,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          style: TextStyle(
            fontSize: 44.0.px,
            height: 1.36,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0.0),
            isCollapsed: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (String value) {
            setState(() {
              _value = value;
            });
          },
          onTap: () {
            setState(() {
              _isShowEmoji = false;
            });
          },
        ),
      ),
    );
  }

  Widget _buildEmojiWidget() {
    return Container(
      height: 760.0.px,
      color: Color(0xffededed),
      child: GridView(
        padding: EdgeInsets.all(44.0.px),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
          mainAxisSpacing: 40.0.px,
          crossAxisSpacing: 40.0.px,
          childAspectRatio: 1,
        ),
        children: List.generate(_emojis.length, (index) {
          return GestureDetector(
            child: Center(
              child: Text(
                String.fromCharCode(_emojis[index].unicode!),
                key: ValueKey(_emojis[index].unicode!),
                style: TextStyle(
                  fontSize: 70.0.px,
                ),
              ),
            ),
            onTap: () {
              _textEditingController.text += String.fromCharCode(_emojis[index].unicode!);
              setState(() {});
            },
          );
        }),
      ),
    );
  }
}
