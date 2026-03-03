import 'package:flutter/material.dart';

/// AppColors class to define the color palette for the application
/// This class contains static constants for various colors used in the app.
class AppColors {
  AppColors._(); // prevent instantiation

  // Brand
  static const Color primary = Color(0xFF1E88E5); // Pokédex red
  static const Color blueSemiLight = Color(0xFF4565B7);
  static const Color primaryDark = Color(0xFF173EA5);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // Backgrounds
  static const Color background = Color(0xFFE8E8E8);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color card = Color(0xFFFFFFFF);

  // Text
  static const Color textDark = Color(0xFF1D1D1D);
  static const Color textMedium = Color(0xFF666666);
  static const Color textLight = Color(0xFFFFFFFF);

  // Pokémon type palette
  static const Map<String, Color> typeColors = {
    'normal': Color(0xFFA8A77A),
    'fire': Color(0xFFEE8130),
    'water': Color(0xFF6390F0),
    'electric': Color(0xFFF7D02C),
    'grass': Color(0xFF7AC74C),
    'ice': Color(0xFF96D9D6),
    'fighting': Color(0xFFC22E28),
    'poison': Color(0xFFA33EA1),
    'ground': Color(0xFFE2BF65),
    'flying': Color(0xFFA98FF3),
    'psychic': Color(0xFFF95587),
    'bug': Color(0xFFA6B91A),
    'rock': Color(0xFFB6A136),
    'ghost': Color(0xFF735797),
    'dragon': Color(0xFF6F35FC),
    'dark': Color(0xFF705746),
    'steel': Color(0xFFB7B7CE),
    'fairy': Color(0xFFD685AD),
  };

  static Color forType(String type) =>
      typeColors[type.toLowerCase()] ?? const Color(0xFFA8A77A);

  // ================= WHITE & BLACK =================

  static const white = Color(0xFFFFFFFF);
  static const black100 = Color(0xFF121212);
  static const black90 = Color(0xFF1C1C1C);
  static const black80 = Color(0xFF2A2A2A);
  static const black70 = Color(0xFF3D3D3D);
  static const black60 = Color(0xFF4F4F4F);
  static const black50 = Color(0xFF626262);
  static const black40 = Color(0xFF808080);
  static const black30 = Color(0xFFA0A0A0);
  static const black20 = Color(0xFFC0C0C0);
  static const black10 = Color(0xFFE0E0E0);

  // ================= GRAY =================

  static const Color gray10 = Color(0xFFF9F9F9);
  static const Color gray20 = Color(0xFFF0F0F0);
  static const Color gray30 = Color(0xFFE0E0E0);
  static const Color gray40 = Color(0xFFCCCCCC);
  static const Color gray50 = Color(0xFFB3B3B3);
  static const Color gray60 = Color(0xFF999999);
  static const Color gray70 = Color(0xFF666666);
  static const Color gray80 = Color(0xFF4D4D4D);
  static const Color gray90 = Color(0xFF262626);

  // ================= PRIMARY =================

  static const Color orange10 = Color(0xFFFFF3E6); // más claro
  static const Color orange20 = Color(0xFFFFE0BF);
  static const Color orange30 = Color(0xFFFFC080);
  static const Color orange40 = Color(0xFFFFA14C);
  static const Color orange50 = Color(0xFFFF8A1F); // hover
  static const Color orange60 = Color(0xFFFF6A00); // base
  static const Color orange70 = Color(0xFFD65A00); // pressed
  static const Color orange80 = Color(0xFFB34A00);
  static const Color orange90 = Color(0xFF803300);
  static const Color orange100 = Color(0xFF401A00); // más oscuro

  // ================= SUCCESS (GREEN) =================

  static const green100 = Color(0xFF0E3F2E);
  static const green90 = Color(0xFF146C4B);
  static const green80 = Color(0xFF1A9B68);
  static const green70 = Color(0xFF25C388);
  static const green60 = Color(0xFF53D6A2);
  static const green50 = Color(0xFF7BEAB9);
  static const green40 = Color(0xFFA4F7D1);
  static const green30 = Color(0xFFC6FDE4);
  static const green20 = Color(0xFFE5FFF5);
  static const green10 = Color(0xFFF2FFF9);

  // ================= ERROR (RED) =================

  static const red100 = Color(0xFF5A1C1C);
  static const red90 = Color(0xFF8C2C2C);
  static const red80 = Color(0xFFBE3B3B);
  static const red70 = Color(0xFFE05454);
  static const red60 = Color(0xFFFF7A7A);
  static const red50 = Color(0xFFFF9C9C);
  static const red40 = Color(0xFFFFBDBD);
  static const red30 = Color(0xFFFFDCDC);
  static const red20 = Color(0xFFFFEEEE);
  static const red10 = Color(0xFFFFF5F5);

  // ================= WARNING (AMBER) =================

  static const yellow100 = Color(0xFF664D00);
  static const yellow90 = Color(0xFF997300);
  static const yellow80 = Color(0xFFCC9900);
  static const yellow70 = Color(0xFFFFB800);
  static const yellow60 = Color(0xFFFFC933);
  static const yellow50 = Color(0xFFFFD966);
  static const yellow40 = Color(0xFFFFE699);
  static const yellow30 = Color(0xFFFFF0CC);
  static const yellow20 = Color(0xFFFFF8E5);
  static const yellow10 = Color(0xFFFFFCF5);

  // ================= INFO (CYAN) =================

  static const blue100 = Color(0xFF003F5C);
  static const blue90 = Color(0xFF00587A);
  static const blue80 = Color(0xFF007C9C);
  static const blue70 = Color(0xFF009DC2);
  static const blue60 = Color(0xFF30B9D9);
  static const blue50 = Color(0xFF65D0E9);
  static const blue40 = Color(0xFF96E5F6);
  static const blue30 = Color(0xFFCBF5FD);
  static const blue20 = Color(0xFFE7FAFE);
  static const blue10 = Color(0xFFF3FDFF);
}

abstract final class AppColorsDark {
  AppColorsDark._();

  // Backgrounds — layered surfaces (Material You elevation model)
  static const Color background = Color(0xFF121212); // lowest layer
  static const Color surface = Color(0xFF1E1E1E); // cards, sheets
  static const Color surfaceVar = Color(0xFF2A2A2A); // elevated cards
  static const Color appBar = Color(0xFF1A1A1A);
  static const Color navBar = Color(0xFF1E1E1E);

  // Borders & dividers
  static const Color cardBorder = Color(0xFF2E2E2E);
  static const Color divider = Color(0xFF2E2E2E);

  // Text
  static const Color textPrimary = Color(0xFFEEEEEE);
  static const Color textSecondary = Color(0xFF9E9E9E);

  // Input
  static const Color inputFill = Color(0xFF2A2A2A);

  // Chips
  static const Color chipBg = Color(0xFF2E2E2E);

  // SnackBar
  static const Color snackBarBg = Color(0xFF323232);
}
