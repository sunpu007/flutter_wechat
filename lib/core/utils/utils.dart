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

/// 时间过滤器
String timeFilter(int time) {
  int curTime = DateTime.now().millisecondsSinceEpoch;
  var diff = (curTime - time) ~/ 1000;

  const dayTime = 60 * 60 * 24;
  const hTime = 60 * 60;
  const mTime = 60;

  int day = (diff / dayTime).floor();
  int h = ((diff - day * dayTime) / hTime).floor();
  int m = ((diff - day * dayTime - h * hTime) / mTime).floor();

  if (day > 0) {
    return '$day天前';
  } else if (h > 0) {
    return '$h小时前';
  } else if (m > 0) {
    return '$m分钟前';
  }
  return '刚刚';
}