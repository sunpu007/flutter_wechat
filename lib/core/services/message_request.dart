import 'package:flutter_wechat/core/model/message_model.dart';

import 'http_request.dart';

class MessageRequest {
  static Future<List<MessageModel>> getMessageData() async {
    final url = '/message.json';
    final result = await HttpRequest.request(url);

    final messageArray = result['data']['list'];

    List<MessageModel> messages = [];
    for (var json in messageArray) {
      messages.add(MessageModel.fromJson(json));
    }
    return messages;
  }
}