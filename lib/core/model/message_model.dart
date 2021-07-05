import 'package:flutter_wechat/core/model/user_info_model.dart';

class MessageModel {
  late int time;
  late String message;
  late int isNotDisturb;
  late int senderId;
  late UserInfoModel? userInfo;

  MessageModel({this.time = 0, this.message = '', this.isNotDisturb = 1, this.senderId = 0, this.userInfo});

  MessageModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    message = json['message'];
    isNotDisturb = json['isNotDisturb'];
    senderId = json['senderId'];
    userInfo = UserInfoModel.fromJson(json['userInfo']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['message'] = this.message;
    data['isNotDisturb'] = this.isNotDisturb;
    data['senderId'] = this.senderId;
    data['userInfo'] = this.userInfo!.toJson();
    return data;
  }
}