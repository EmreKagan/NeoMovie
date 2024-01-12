import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonetmovieapp/view/theme/color_schemes.g.dart';

ThemeData darkThemeData({double fontSize = 8.0}){
  return ThemeData(
    textTheme: TextTheme(
      displaySmall:  TextStyle(
        //white text
          fontSize: fontSize,
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: colorScheme.onPrimary
      ),
      displayMedium: TextStyle(
        //black text
          fontSize: fontSize,
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: colorScheme.surface
      ),
      titleMedium: TextStyle(
        //white 16px main title
          fontSize: fontSize,
          fontFamily: GoogleFonts.irishGrover().fontFamily,
          color: colorScheme.onSecondary
      ),
    ),
  );
}