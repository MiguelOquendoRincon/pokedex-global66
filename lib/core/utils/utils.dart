import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Utility function to get the app version
/// This function retrieves the version and build number of the application.
Future<String> getAppVersion() async {
  final info = await PackageInfo.fromPlatform();
  return '${info.version} (${info.buildNumber})';
}

/// Creates a fade transition route for navigating to the home screen
/// This method uses a PageRouteBuilder to create a custom transition effect.
Route fadeRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 2000),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
