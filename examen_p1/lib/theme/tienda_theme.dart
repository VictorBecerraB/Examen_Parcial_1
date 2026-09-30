import 'package:flutter/material.dart';

class TiendaTheme {
  static const colorPrimario = Color(0xFF315E58);
  static const colorFondo = Color(0xFFF4F3EF);

  static ThemeData get claro => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: colorPrimario,
      surface: colorFondo,
    ),
    scaffoldBackgroundColor: colorFondo,
    appBarTheme: const AppBarTheme(
      backgroundColor: colorPrimario,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFD4D7D2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: colorPrimario, width: 1.5),
      ),
    ),
  );
}
