import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_wechat/core/utils/utils.dart';

void main() {

  test('checkMobile', () {
    expect(checkMobile('13572042154'), true);
  });

  test('checkUrl', () {
    expect(checkUrl('https://www.myjerry.cn'), true);
  });

  test('formatStr', () {
    expect(formatStr('你好，我是{0}，年龄{1}', ['Jerry', 18]), '你好，我是Jerry，年龄18');
  });
}