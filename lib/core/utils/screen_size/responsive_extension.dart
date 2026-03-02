import 'package:flutter/material.dart';

import 'package:pokedex_global66/core/helpers/screen_size/responsive_util.dart';

/// An extension on [BuildContext] to provide easy access to responsive utilities.
/// This allows you to call `context.responsive` to get an instance of [ResponsiveUtil].
/// It simplifies the process of accessing responsive design features throughout your app.
extension ResponsiveContext on BuildContext {
  /// Provides an instance of [ResponsiveUtil] for the current context.
  /// This instance can be used to scale dimensions based on the screen size,
  /// including width, height, font size, icon size, and radius for circular widgets.
  /// Example usage:
  /// ```dart
  ///   double scaledWidth = context.responsive.scaledWidth(100);
  /// ```
  ResponsiveUtil get responsive => ResponsiveUtil(this);
}
