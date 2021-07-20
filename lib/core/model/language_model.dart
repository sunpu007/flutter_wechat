class LanguageModel {
  String? languageCode;
  String? countryName;

  LanguageModel({this.languageCode, this.countryName});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    languageCode = json['languageCode'];
    countryName = json['countryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['languageCode'] = this.languageCode;
    data['countryName'] = this.countryName;
    return data;
  }
}