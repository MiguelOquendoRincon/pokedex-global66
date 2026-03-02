import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Service to show snackbars
/// This service is used to show snackbars throughout the application.
class SnackbarService {
  static final SnackbarService _instance = SnackbarService._internal();

  factory SnackbarService() => _instance;

  SnackbarService._internal();

  late GlobalKey<ScaffoldMessengerState> _messengerKey;

  /// Initialize the snackbar service
  /// This function is called by the main function to initialize the snackbar service.
  void init(GlobalKey<ScaffoldMessengerState> key) {
    _messengerKey = key;
  }

  /// Show a snackbar
  /// This function is used to show a snackbar throughout the application.
  void show(String message, {bool isError = false}) {
    _messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? CupertinoColors.systemRed
            : CupertinoColors.activeGreen,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
