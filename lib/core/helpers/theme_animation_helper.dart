import 'package:flutter/material.dart';

class ThemeAnimationHelper {
  static Future<T?> pushWithSlideTransition<T>(
    BuildContext context,
    Widget screen, {
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.easeInOut,
    Offset beginOffset = const Offset(1, 0), // derecha → izquierda
  }) {
    return Navigator.of(context).push<T>(
      PageRouteBuilder(
        pageBuilder: (_, _, _) => screen,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, _, child) {
          final offsetAnimation = Tween<Offset>(
            begin: beginOffset,
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: curve));
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  static Future<T?> pushWithFadeTransition<T>(
    BuildContext context,
    Widget screen, {
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.easeInOut,
  }) {
    return Navigator.of(context).push<T>(
      PageRouteBuilder(
        pageBuilder: (_, _, _) => screen,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(
            opacity: animation.drive(CurveTween(curve: curve)),
            child: child,
          );
        },
      ),
    );
  }

  static Future<T?> pushReplacementWithFade<T>(
    BuildContext context,
    Widget screen, {
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.easeInOut,
  }) {
    return Navigator.of(context).pushReplacement<T, T>(
      PageRouteBuilder(
        pageBuilder: (_, _, _) => screen,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(
            opacity: animation.drive(CurveTween(curve: curve)),
            child: child,
          );
        },
      ),
    );
  }

  static void popWithFadeOut(
    BuildContext context, {
    int milliseconds = 400,
  }) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    // ignore: use_build_context_synchronously
    if (Navigator.canPop(context)) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  }
}
