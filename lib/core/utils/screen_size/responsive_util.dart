import 'package:flutter/material.dart';

/// A utility class to handle responsive design in Flutter applications.
/// It provides methods to scale dimensions based on the screen size,
/// including width, height, font size, icon size, and radius for circular widgets.
class ResponsiveUtil {
  final BuildContext context;
  late double screenWidth;
  late double screenHeight;
  late Orientation orientation;
  late double fontSizeMultiplier;

  ResponsiveUtil(this.context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    orientation = MediaQuery.of(context).orientation;
    fontSizeMultiplier = _calculateFontSizeMultiplier();
  }

  // Calculates a font size multiplier based on the screen width
  double _calculateFontSizeMultiplier() {
    if (screenWidth < 600) {
      return 0.8; // Mobile
    } else if (screenWidth < 1200) {
      return 1.0; // Tablet
    } else {
      return 1.2; // Desktop
    }
  }

  // Scales width based on a reference screen width (375 for mobile)
  double scaledWidth(double value) => value * (screenWidth / 375);

  // Scales height based on a reference screen height (667 for mobile)
  double scaledHeight(double value) => value * (screenHeight / 667);

  // Scales font size based on the screen width and a multiplier
  double scaledFontSize(double value) {
    final scale = _clampedScale(value, screenWidth);
    return scale * fontSizeMultiplier;
  }

  // Scales icon size based on the screen width
  double scaledIconSize(double value) => _clampedScale(value, screenWidth);

  // Scales radius for circular widgets based on the screen width
  double scaledRadius(double value) => _clampedScale(value, screenWidth);

  // Scales padding based on the screen width, ensuring it doesn't get too small or too large
  double scaledPadding(double value) {
    // Use a clamped scale for padding to ensure it doesn't get too small or too large
    return _clampedScale(value, screenWidth);
  }

  // Scales padding based on the screen width
  double _clampedScale(double value, double reference) {
    const double minScaleFactor = 0.85; // Minimum scale factor
    const double maxScaleFactor = 1.25; // Maximum scale factor
    double scaleFactor = reference / 375; // Base width for scaling
    scaleFactor = scaleFactor.clamp(minScaleFactor, maxScaleFactor);
    return value * scaleFactor;
  }
}
