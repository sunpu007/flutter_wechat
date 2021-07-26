class EmojiModel {
  String? name;
  int? unicode;

  EmojiModel({this.name, this.unicode});

  EmojiModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    unicode = json['unicode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['unicode'] = this.unicode;
    return data;
  }
}