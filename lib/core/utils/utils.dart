import 'dart:math';

bool checkMobile(mobile) {
  if (mobile == null || mobile.toString() == '') return false;
  // RegExp(i/^1[34578]\d{9}$/)
  if (RegExp(r'^1[34578]\d{9}$').hasMatch(mobile)) {
    return true;
  } else {
    return false;
  }
}