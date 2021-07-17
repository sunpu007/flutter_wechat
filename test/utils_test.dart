import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_wechat/core/utils/utils.dart';

void main() {

  test('checkMobile', () {
    expect(checkMobile('13572042154'), true);
  });
}