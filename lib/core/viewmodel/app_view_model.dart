import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppViewModel extends ChangeNotifier {
  String _languageCode = '';

  AppViewModel() {
    SharedPreferences.getInstance().then((prefs) {
      _languageCode = (prefs.getString('languageCode') != null ? prefs.getString('languageCode') : '')!;
      notifyListeners();
    });
  }

  String get languageCode => _languageCode;

  set languageCode(String value) {
    _languageCode = value;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('languageCode', value);
    });
    notifyListeners();
  }
}