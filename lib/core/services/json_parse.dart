import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_wechat/core/model/address_books_model.dart';
import 'package:flutter_wechat/core/model/language_model.dart';

class JsonParse {
  static Future<List<AddressBooksModel>> getAddressBooksData() async {
    final jsonString = await rootBundle.loadString("assets/json/address_books.json");

    final result = json.decode(jsonString);

    List<AddressBooksModel> addressBooks = [];
    for(var json in result) {
      addressBooks.add(AddressBooksModel.fromJson(json));
    }

    return addressBooks;
  }

  static Future<List<LanguageModel>> getLanguagesData() async {
    final jsonString = await rootBundle.loadString("assets/json/language.json");

    final result = json.decode(jsonString);

    List<LanguageModel> languages = [];
    for(var json in result) {
      languages.add(LanguageModel.fromJson(json));
    }

    return languages;
  }
}