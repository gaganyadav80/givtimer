import 'package:flutter/material.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPurpleColor = Color(0xFF6200ED);

final theme = ThemeData(
  textTheme: GoogleFonts.robotoTextTheme(),
  primaryColorDark: const Color(0xFF0097A7),
  primaryColorLight: const Color(0xFFB2EBF2),
  // primaryColor: const Color(0xFF00BCD4),
  colorScheme: const ColorScheme.light(secondary: Color(0xFF009688)),
  // scaffoldBackgroundColor: const Color(0xFFF2F2F7),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xFFFAFAFA),
    iconTheme: IconThemeData(color: Colors.black),
    toolbarTextStyle: TextStyle(color: Colors.black),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kDefaultRadius),
    ),
  ),
);
