import 'package:flutter_wechat/core/model/user_info_model.dart';

class DynamicModel {
  int? id;
  String? content;
  List<String>? images;
  UserInfoModel? userInfo;
  int? timestamp;

  DynamicModel(
      {this.id, this.content, this.images, this.userInfo, this.timestamp});

  DynamicModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    images = json['images'].cast<String>();
    userInfo = json['userInfo'] != null
        ? new UserInfoModel.fromJson(json['userInfo'])
        : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['images'] = this.images;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo!.toJson();
    }
    data['timestamp'] = this.timestamp;
    return data;
  }
}