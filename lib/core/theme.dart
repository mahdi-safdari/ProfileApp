import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppThemeConfig {
  final Color primaryColor = Colors.redAccent.shade200;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = const Color(0x0dffffff),
        backgroundColor = const Color(0xff1e1e1e),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = const Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = const Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getThemeData() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      brightness: brightness,
      // scaffoldBackgroundColor: const Color(0xff1e1e1e),
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      primarySwatch: Colors.pink,
      dividerColor: surfaceColor,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarColor,
        surfaceTintColor: Colors.transparent,
      ),
      textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
          bodyMedium: TextStyle(fontSize: 15, color: primaryTextColor),
          bodySmall: TextStyle(fontSize: 14, color: secondaryTextColor),
          // bodySmall: TextStyle(fontSize: 14, color: Color.fromARGB(180, 255, 255, 255)),
          titleLarge: TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
          titleMedium: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: primaryTextColor),
        ),
      ),
      useMaterial3: true,
    );
  }
}
