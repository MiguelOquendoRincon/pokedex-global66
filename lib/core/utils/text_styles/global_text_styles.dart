import 'package:flutter/material.dart';

import 'package:pokedex_global66/core/services/injection_container.dart';
import 'package:pokedex_global66/core/storage/local_storage.dart';

/// A utility class that provides globally consistent text styles
/// with responsive scaling for different screen sizes.
///
/// This class ensures consistent typography throughout the application,
/// adapting font sizes based on screen width and user font preferences.
class GlobalTextStyles {
  GlobalTextStyles._();

  static final UserPreferences prefs = sl<UserPreferences>();

  // ==================================================================
  //                           HELPER METHODS
  // ==================================================================

  /// Scales the font size according to the user's font preference and screen size.
  static double _responsiveFontSize(double size) {
    final multiplier = switch (prefs.fontSize) {
      FontSizePreference.small => 0.85,
      FontSizePreference.medium => 1.0,
      FontSizePreference.large => 1.15,
      FontSizePreference.extraLarge => 1.3,
    };
    return size * multiplier;
  }

  /// Determines the size category based on the screen width.
  static String get _sizeCategory {
    final width = prefs.screenWidth;
    if (width < 795) {
      return 'small';
    } else if (width < 1047) {
      return 'large';
    } else {
      return 'extraLarge';
    }
  }

  /// Returns the text color based on the current theme's brightness.
  /// This ensures that text is readable against the background color.
  static Color _textColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  // ========================= TEXT STYLES =========================

  static TextStyle display(BuildContext context) =>
      _textStyle(context, _sizeCategory, 36, 40, 48, bold: true);

  static TextStyle h1Title(BuildContext context) =>
      _textStyle(context, _sizeCategory, 32, 36, 40, bold: true);

  static TextStyle h2Heading(BuildContext context) =>
      _textStyle(context, _sizeCategory, 28, 32, 36, bold: true);

  static TextStyle h3Subheading(BuildContext context) =>
      _textStyle(context, _sizeCategory, 24, 28, 32, bold: true);

  static TextStyle h4Subtitle(BuildContext context) =>
      _textStyle(context, _sizeCategory, 20, 24, 28, bold: true);

  static TextStyle h5SmallTitle(BuildContext context) =>
      _textStyle(context, _sizeCategory, 18, 20, 24, bold: true);

  static TextStyle h6SmallSubtitle(BuildContext context) =>
      _textStyle(context, _sizeCategory, 16, 18, 20, bold: true);

  static TextStyle boldSmallBody(BuildContext context) =>
      _textStyle(context, _sizeCategory, 14, 16, 18, bold: true);

  static TextStyle boldMinimumBody(BuildContext context) =>
      _textStyle(context, _sizeCategory, 12, 14, 16, bold: true);

  static TextStyle largeBody(BuildContext context) =>
      _textStyle(context, _sizeCategory, 18, 20, 24);

  static TextStyle mediumBody(BuildContext context) =>
      _textStyle(context, _sizeCategory, 16, 18, 20);

  static TextStyle smallBody(BuildContext context) =>
      _textStyle(context, _sizeCategory, 14, 16, 18);

  static TextStyle minimumBody(BuildContext context) =>
      _textStyle(context, _sizeCategory, 12, 14, 16);

  static TextStyle _textStyle(
    BuildContext context,
    String category,
    double small,
    double large,
    double extraLarge, {
    bool bold = false,
  }) {
    double size = switch (category) {
      'large' => large,
      'extraLarge' => extraLarge,
      _ => small,
    };
    return TextStyle(
      fontSize: _responsiveFontSize(size),
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      color: _textColor(context),
    );
  }
}
