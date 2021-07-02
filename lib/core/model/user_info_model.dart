class UserInfoModel {
  late int userId;
  late String name;
  late String avatarUrl;
  late int sex;
  late String province;
  late String city;
  late String openId;

  UserInfoModel({
    this.userId = 0,
    this.name = '',
    this.avatarUrl = '',
    this.sex = -1,
    this.province = '',
    this.city = '',
    this.openId = ''
  });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    avatarUrl = json['avatarUrl'];
    sex = json['sex'];
    province = json['province'];
    city = json['city'];
    openId = json['openId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['avatarUrl'] = this.avatarUrl;
    data['sex'] = this.sex;
    data['province'] = this.province;
    data['city'] = this.city;
    data['openId'] = this.openId;
    return data;
  }
}