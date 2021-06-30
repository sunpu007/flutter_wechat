import 'package:flutter_wechat/core/model/user_info_model.dart';

class AddressBooksModel {
  late String letter;
  late List<UserInfoModel> children;

  AddressBooksModel({this.letter = '', this.children = const <UserInfoModel>[]});

  AddressBooksModel.fromJson(Map<String, dynamic> json) {
    letter = json['letter'];
    children = [];
    if (json['children'] != null) {
      json['children'].forEach((userInfoJson) {
        children.add(UserInfoModel.fromJson(userInfoJson));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['letter'] = this.letter;
    if (this.children.length > 0) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    return data;
  }
}