import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static ThemeData get lightThemeData {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorSchemeSeed: Colors.redAccent,
      textTheme: GoogleFonts.poppinsTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.redAccent),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white
      )
    );
  }
}
