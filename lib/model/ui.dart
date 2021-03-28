import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Theme {

  /**
   * 登录界面，定义渐变的颜色
   */
  static const Color loginGradientStart = const Color.fromRGBO(223, 255, 0, 0.855);
  static const Color loginGradientEnd = const Color.fromRGBO(255, 100, 50, 0.7);

  static const LinearGradient primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}