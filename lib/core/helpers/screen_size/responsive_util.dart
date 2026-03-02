import 'package:flutter/material.dart';

class ResponsiveUtil {
  final BuildContext context;
  late double screenWidth;
  late double screenHeight;
  late bool isTablet;
  late double fontSizeMultiplier;
  late Orientation screenOrientation;

  ResponsiveUtil(this.context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    isTablet = size.width >= 600;
    screenOrientation = MediaQuery.of(context).orientation;
  }

  // Scales width based on a reference screen width of 375.
  double scaledWidth(double value) => value * (screenWidth / 375);

  // Scales height based on a reference screen height of 812.
  double scaledHeight(double value) => value * (screenHeight / 812);

  // Scales font size considering the screen width and user's font preference.
  double scaledFontSize(double fontSize) {
    final scale = _clampedScale(fontSize, screenWidth);
    return scale * fontSizeMultiplier; // Apply user's font multiplier
  }

  // Scales icon size with clamping.
  double scaledIconSize(double iconSize) =>
      _clampedScale(iconSize, screenWidth);

  // Scales radius size with clamping.
  double scaledRadiusSize(double radius) => _clampedScale(radius, screenWidth);

  // Returns scaled padding.
  EdgeInsets scaledPadding({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) => EdgeInsets.only(
    top: scaledHeight(top),
    bottom: scaledHeight(bottom),
    left: scaledWidth(left),
    right: scaledWidth(right),
  );

  // Returns scaled symmetric padding.
  EdgeInsets scaledSymmetricPadding({
    double horizontal = 0,
    double vertical = 0,
  }) => EdgeInsets.symmetric(
    horizontal: scaledWidth(horizontal),
    vertical: scaledHeight(vertical),
  );

  // Returns a scaled box with width and height.
  SizedBox scaledBox({double? width, double? height}) => SizedBox(
    width: width != null ? scaledWidth(width) : null,
    height: height != null ? scaledHeight(height) : null,
  );

  // Scales spacing between widgets.
  Widget scaledSpacer({double? height, double? width}) {
    return SizedBox(
      height: height != null ? scaledHeight(height) : null,
      width: width != null ? scaledWidth(width) : null,
    );
  }

  // Scales margins for widgets.
  EdgeInsets scaledMargin({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) => scaledPadding(top: top, bottom: bottom, left: left, right: right);

  // Clamps scaling to avoid extreme values.
  double _clampedScale(double value, double reference) {
    const double minScaleFactor = 0.85; // Minimum scale factor
    const double maxScaleFactor = 1.25; // Maximum scale factor
    double scaleFactor = reference / 375;
    scaleFactor = scaleFactor.clamp(minScaleFactor, maxScaleFactor);
    return value * scaleFactor;
  }
}
