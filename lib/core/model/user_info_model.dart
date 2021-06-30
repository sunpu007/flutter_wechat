class UserInfoModel {
  int userId;
  String name;
  String avatarUrl;
  int sex;

  UserInfoModel({this.userId, this.name, this.avatarUrl, this.sex});

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