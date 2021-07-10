import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  String _token = '';

  UserViewModel() {
    SharedPreferences.getInstance().then((prefs) {
      _token = prefs.getString('token')!;
      notifyListeners();
    });
  }

  String get token => _token;

  set token(String value) {
    _token = value;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('token', value);
    });
    notifyListeners();
  }
}