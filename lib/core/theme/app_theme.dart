import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';

abstract final class AppTheme {
  AppTheme._();

  // ─── Light ──────────────────────────────────────────────────────────────────
  static ThemeData get light => _build(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      surface: AppColors.surface,
      onSurface: AppColors.textDark,
    ),
    scaffoldBg: AppColors.background,
    cardBg: AppColors.surface,
    appBarBg: AppColors.primary,
    appBarFg: AppColors.onPrimary,
    navBarBg: AppColors.surface,
    navBarIndicator: AppColors.primary.withValues(alpha: 0.12),
    navBarSelected: AppColors.primary,
    navBarUnselected: AppColors.textMedium,
    dividerColor: const Color(0xFFE0E0E0),
    inputFill: Colors.white,
    switchActiveColor: AppColors.primary,
    statusBarBrightness: Brightness.light,
  );

  // ─── Dark ───────────────────────────────────────────────────────────────────
  static ThemeData get dark => _build(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      surface: AppColorsDark.surface,
      onSurface: AppColorsDark.textPrimary,
    ),
    scaffoldBg: AppColorsDark.background,
    cardBg: AppColorsDark.surface,
    appBarBg: AppColorsDark.appBar,
    appBarFg: AppColorsDark.textPrimary,
    navBarBg: AppColorsDark.navBar,
    navBarIndicator: AppColors.primary.withValues(alpha: 0.20),
    navBarSelected: AppColors.primary,
    navBarUnselected: AppColorsDark.textSecondary,
    dividerColor: AppColorsDark.divider,
    inputFill: AppColorsDark.inputFill,
    switchActiveColor: AppColors.primary,
    statusBarBrightness: Brightness.dark,
  );

  // ─── Builder ─────────────────────────────────────────────────────────────────
  static ThemeData _build({
    required Brightness brightness,
    required ColorScheme colorScheme,
    required Color scaffoldBg,
    required Color cardBg,
    required Color appBarBg,
    required Color appBarFg,
    required Color navBarBg,
    required Color navBarIndicator,
    required Color navBarSelected,
    required Color navBarUnselected,
    required Color dividerColor,
    required Color inputFill,
    required Color switchActiveColor,
    required Brightness statusBarBrightness,
  }) {
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBg,

      // ── AppBar ───────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBg,
        foregroundColor: appBarFg,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.15),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: appBarFg,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: statusBarBrightness,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
          systemNavigationBarColor: navBarBg,
          systemNavigationBarIconBrightness: isDark
              ? Brightness.light
              : Brightness.dark,
        ),
      ),

      // ── NavigationBar (Material 3 bottom nav) ────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: navBarBg,
        indicatorColor: navBarIndicator,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? navBarSelected : navBarUnselected,
            size: 24,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            color: selected ? navBarSelected : navBarUnselected,
          );
        }),
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.1),
      ),

      // ── Card ─────────────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: cardBg,
        elevation: isDark ? 1 : 2,
        shadowColor: Colors.black.withValues(alpha: isDark ? 0.3 : 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isDark
              ? BorderSide(color: AppColorsDark.cardBorder, width: 0.5)
              : BorderSide.none,
        ),
      ),

      // ── Input / TextField ─────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFill,
        hintStyle: GoogleFonts.poppins(
          color: isDark
              ? AppColorsDark.textSecondary
              : AppColors.textMedium.withValues(alpha: 0.6),
          fontSize: 14,
        ),
        prefixIconColor: isDark
            ? AppColorsDark.textSecondary
            : AppColors.textMedium,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),

      // ── Chip ─────────────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: isDark
            ? AppColorsDark.chipBg
            : const Color(0xFFF0F0F0),
        labelStyle: GoogleFonts.poppins(
          fontSize: 13,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),

      // ── Switch ────────────────────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? switchActiveColor : null,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected)
              ? switchActiveColor.withValues(alpha: 0.4)
              : null,
        ),
      ),

      // ── Divider ───────────────────────────────────────────────────────────
      dividerTheme: DividerThemeData(color: dividerColor, thickness: 0.5),

      // ── FilledButton ──────────────────────────────────────────────────────
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ── TextButton ────────────────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.primary),
      ),

      // ── ListTile ──────────────────────────────────────────────────────────
      listTileTheme: ListTileThemeData(
        iconColor: AppColors.primary,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        subtitleTextStyle: GoogleFonts.poppins(
          fontSize: 12,
          color: isDark ? AppColorsDark.textSecondary : AppColors.textMedium,
        ),
      ),

      // ── ProgressIndicator ─────────────────────────────────────────────────
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),

      // ── SnackBar ──────────────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark
            ? AppColorsDark.snackBarBg
            : const Color(0xFF323232),
        contentTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),

      // ── Typography ────────────────────────────────────────────────────────
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        headlineLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 26,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        labelMedium: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
        labelSmall: GoogleFonts.poppins(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: isDark ? AppColorsDark.textPrimary : AppColors.textDark,
        ),
      ),
    );
  }
}
