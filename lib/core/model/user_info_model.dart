class UserInfoModel {
  late int userId;
  late String name;
  late String avatarUrl;
  late int sex;

  UserInfoModel({this.userId = 0, this.name = '', this.avatarUrl = '', this.sex = -1});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    avatarUrl = json['avatarUrl'];
    sex = json['sex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['avatarUrl'] = this.avatarUrl;
    data['sex'] = this.sex;
    return data;
  }
}