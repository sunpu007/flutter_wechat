import 'package:flutter/material.dart';

import 'package:flutter_wechat/core/model/message_model.dart';
import 'package:flutter_wechat/core/services/message_request.dart';
import 'package:flutter_wechat/ui/components/main_appbar.dart';
import 'package:flutter_wechat/ui/pages/message/user_list_item.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  List<MessageModel> messages = [];

  @override
  initState() {
    super.initState();
    MessageRequest.getMessageData().then((value) {
      setState(() {
        messages = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: MainAppBarComponent('微信'),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return UserListItem(messageModel: messages[index],);
        },
      ),
    );
  }
}
