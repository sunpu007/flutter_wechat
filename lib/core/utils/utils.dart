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

  if (diff < 60) return '刚刚';
  if (diff < 3600) return (diff ~/ 60).toString() + '分钟前';
  if (diff < 86400) return (diff ~/ 3600).toString() + '小时前';
  return (diff ~/ 86400).toString() + '天前';
}

/// 模版字符串替换
String formatStr(String str, List<dynamic> args) {
  if (str == '') return '';
  for (int i = 0; i < args.length; i++) {
    str = str.replaceAll(RegExp(r'\{' + i.toString() + '\}'), args[i].toString());
  }
  return str;
}