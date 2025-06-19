import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Custom color
  static const Color customBlack = Color(0xFF1A2B2F);
  static const Color customSubtitleColor = Color(0xFF003B39);
  static const Color customCyan2 = Color(0xFF21A39E);
  static const Color customGrey = Color(0xFF595959);
  static const Color customLightGrey = Color(0xFFE2E2E2);
  static const Color customWhite = Color(0xFFFFFFFF);
  static const Color customLightImage = Color(0xFFdee8e8);
  static const Color customDarkImage = Color(0xFFc8d7d7);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
    );
  }
}
