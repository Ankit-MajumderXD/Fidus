import 'package:flutter/widgets.dart';

class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  static const EdgeInsets screenPadding =
      EdgeInsets.symmetric(horizontal: md);

  static const BorderRadius cardRadius =
      BorderRadius.all(Radius.circular(24));

  static const BorderRadius chipRadius =
      BorderRadius.all(Radius.circular(16));

  static const BorderRadius buttonRadius =
      BorderRadius.all(Radius.circular(18));
}