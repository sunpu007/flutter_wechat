import 'package:flutter_wechat/ui/shared/screen_fit.dart';

extension DoubleFit on double {
  double get px {
    return ScreenFit.px2Rpx(this);
  }

  double get rpx {
    return ScreenFit.rpx2Px(this);
  }
}
