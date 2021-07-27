import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/model/emoji_model.dart';
import 'package:flutter_wechat/core/services/json_parse.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';

class BottomContext extends StatefulWidget {
  final Function? listeningHeight;

  const BottomContext({Key? key, this.listeningHeight}) : super(key: key);

  @override
  _BottomContextState createState() => _BottomContextState();
}

class _BottomContextState extends State<BottomContext> {
  String _value = '';
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _commentFocus = FocusNode();

  bool _isShowEmoji = false;

  List<EmojiModel> _emojis = [];

  @override
  void initState() {
    super.initState();
    JsonParse.getEmojiData().then((value) {
      setState(() {
        _emojis = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    if (_isShowEmoji) {
                      FocusScope.of(context).requestFocus(_commentFocus);
                    } else {
                      _commentFocus.unfocus();
                    }
                    setState(() {
                      _isShowEmoji = !_isShowEmoji;
                    });
                    Timer(Duration(milliseconds: 100), () => widget.listeningHeight!());
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
      color: Theme.of(context).canvasColor,
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
