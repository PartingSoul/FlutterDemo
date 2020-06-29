import 'dart:ui';

import 'package:flutter/material.dart';

class ScreenUtils {
  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getStatusBarHeight() {
    return MediaQueryData.fromWindow(window).padding.top;
  }
}
