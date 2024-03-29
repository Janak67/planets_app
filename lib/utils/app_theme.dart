import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    centerTitle: true,
    backgroundColor: Colors.white12,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
  ),
  brightness: Brightness.light,
  textTheme: TextTheme(
    titleLarge: GoogleFonts.cinzel(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
    titleMedium: GoogleFonts.cinzel(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    titleSmall: const TextStyle(
        color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
  ),
  brightness: Brightness.dark,
  textTheme: TextTheme(
    titleLarge: GoogleFonts.cinzel(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
    titleMedium: GoogleFonts.cinzel(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    titleSmall: const TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  ),
);
