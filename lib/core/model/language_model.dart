class LanguageModel {
  String? key;
  String? countryName;

  LanguageModel({this.key, this.countryName});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    countryName = json['countryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['countryName'] = this.countryName;
    return data;
  }
}