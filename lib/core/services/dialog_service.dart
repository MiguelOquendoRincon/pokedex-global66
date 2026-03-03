import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/widgets/pokeball_loader.dart';

/// Service to show dialogs
/// This service is used to show dialogs throughout the application.
class DialogService {
  static final DialogService _instance = DialogService._internal();

  factory DialogService() => _instance;

  DialogService._internal();

  late GlobalKey<NavigatorState> _navigatorKey;

  void init(GlobalKey<NavigatorState> key) {
    _navigatorKey = key;
  }

  BuildContext? get _context => _navigatorKey.currentContext;

  /// Show a loading dialog
  /// This function is used to show a loading dialog throughout the application.
  Future<void> showLoading({String message = 'Cargando...'}) async {
    showDialog(
      context: _context!,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Row(
          children: [
            const PokeballLoader(size: 40),
            const SizedBox(width: 16),
            Text(message),
          ],
        ),
      ),
    );
  }

  /// Dismiss the loading dialog
  /// This function is used to dismiss the loading dialog throughout the application.
  void dismiss() {
    if (Navigator.of(_context!).canPop()) {
      Navigator.of(_context!).pop();
    }
  }

  /// Show an error dialog
  /// This function is used to show an error dialog throughout the application.
  Future<void> showError(String message) async {
    await showDialog(
      context: _context!,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(_context!).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Show a success dialog
  /// This function is used to show a success dialog throughout the application.
  Future<void> showSuccess(String message) async {
    await showDialog(
      context: _context!,
      builder: (_) => AlertDialog(
        title: const Text('Éxito'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(_context!).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Show a confirmation dialog
  /// This function is used to show a confirmation dialog throughout the application.
  Future<bool> confirm({
    String title = 'Confirmar',
    String message = '¿Estás seguro?',
  }) async {
    final result = await showDialog<bool>(
      context: _context!,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.of(_context!).pop(false),
          ),
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () => Navigator.of(_context!).pop(true),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
