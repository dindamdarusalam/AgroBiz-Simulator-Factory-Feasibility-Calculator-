import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Modern Agro Palette
  static const Color primaryGreen = Color(0xFF1B5E20); // Deep Forest Green
  static const Color accentGold = Color(0xFFBF9000); // Earthy Gold / Honey
  static const Color surfaceCream = Color(0xFFFAFAFA); // Clean Background
  static const Color cardSurface = Colors.white;
  static const Color textDark = Color(0xFF2D3436);
  static const Color textLight = Color(0xFF636E72);

  // Gradients
  static const LinearGradient premiumGradient = LinearGradient(
    colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFFDC830), Color(0xFFF37335)], // Modern Gold-Orange
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static TextTheme get _textTheme => GoogleFonts.outfitTextTheme();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: surfaceCream,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryGreen,
        primary: primaryGreen,
        secondary: accentGold,
        onSurface: textDark,
        surface: surfaceCream,
      ),
      textTheme: _textTheme.apply(
        bodyColor: textDark,
        displayColor: textDark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: _textTheme.headlineSmall?.copyWith(
          color: primaryGreen,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: primaryGreen),
      ),
      cardTheme: CardThemeData(
        color: cardSurface,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade100,
        prefixIconColor: primaryGreen,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryGreen, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        labelStyle: TextStyle(color: textLight),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: primaryGreen,
        inactiveTrackColor: primaryGreen.withValues(alpha: 0.2),
        thumbColor: accentGold,
        overlayColor: accentGold.withValues(alpha: 0.2),
      ),
    );
  }
}
