import 'package:chatgpt/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: questionLight,
        iconTheme: IconThemeData(color: Colors.black)),
    drawerTheme: DrawerThemeData(backgroundColor: questionLight),
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodySmall: GoogleFonts.lato(color: Colors.grey),
      bodyMedium: GoogleFonts.lato(color: Colors.grey),
      bodyLarge: GoogleFonts.lato(color: Colors.grey),
      displaySmall:
          GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w300),
      displayMedium: GoogleFonts.lato(
          fontSize: 70, color: Colors.black, fontWeight: FontWeight.w300),
      titleMedium: GoogleFonts.lato(color: Colors.black),
      titleLarge: GoogleFonts.lato(color: Colors.black),
      headlineSmall: GoogleFonts.lato(color: Colors.black),
      headlineMedium: GoogleFonts.lato(color: Colors.black),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(backgroundColor: questionDark),
    drawerTheme: DrawerThemeData(backgroundColor: questionDark),
    scaffoldBackgroundColor: Color(0xFF343541),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodySmall: GoogleFonts.lato(color: Colors.grey),
      bodyMedium: GoogleFonts.lato(color: Colors.grey),
      bodyLarge: GoogleFonts.lato(color: Colors.grey),
      displaySmall:
          GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w300),
      displayMedium: GoogleFonts.lato(
          fontSize: 70, color: Colors.white, fontWeight: FontWeight.w300),
      titleMedium: GoogleFonts.lato(color: Colors.white),
      titleLarge: GoogleFonts.lato(color: Colors.white),
      headlineSmall: GoogleFonts.lato(color: Colors.white),
      headlineMedium: GoogleFonts.lato(color: Colors.white),
    ),
  );
}
