import 'package:flutter_wechat/ui/shared/screen_fit.dart';

extension IntFit on int {
  double get px {
    return ScreenFit.px2Rpx(this.toDouble());
  }

  double get rpx {
    return ScreenFit.rpx2Px(this.toDouble());
  }
}