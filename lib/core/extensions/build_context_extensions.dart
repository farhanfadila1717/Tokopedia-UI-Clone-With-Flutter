import 'package:flutter/widgets.dart';

extension BuildContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  double toViewport(double value) {
    final viewport = value / screenWidth;

    return viewport;
  }
}
