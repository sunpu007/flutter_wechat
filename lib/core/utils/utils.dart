import 'dart:math';

/// 验证手机号
bool checkMobile(String mobile) {
  if (mobile.isEmpty) return false;
  if (RegExp(r'^1[34578]\d{9}$').hasMatch(mobile)) {
    return true;
  } else {
    return false;
  }
}

/// 验证url
bool checkUrl(String url) {
  if (url.isEmpty) return false;
  if (RegExp(r'[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+\.?').hasMatch(url)) {
    return true;
  } else {
    return false;
  }
}