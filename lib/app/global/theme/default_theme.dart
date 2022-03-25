import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiki/app/global/theme/colors.dart';

class DefaultTheme {
  static ThemeData get theme => ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: MyColors.primary)
          .copyWith(secondary: Colors.greenAccent),
      primaryColor: Colors.orange,
      inputDecorationTheme: const InputDecorationTheme(
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          fillColor: Colors.orange,
          iconColor: Colors.white),
      appBarTheme:
          AppBarTheme(elevation: 0, backgroundColor: MyColors.secondary),
      scaffoldBackgroundColor: MyColors.secondary,
      textTheme: _textTheme(Colors.white));

  static TextTheme _textTheme(Color color) => TextTheme(
      headline1: GoogleFonts.poppins(
          fontSize: 46, fontWeight: FontWeight.w800, color: color),
      headline2: GoogleFonts.poppins(
          fontSize: 60, fontWeight: FontWeight.w700, color: color),
      headline3: GoogleFonts.poppins(
          fontSize: 48, fontWeight: FontWeight.w600, color: color),
      headline4: GoogleFonts.poppins(
          fontSize: 30, fontWeight: FontWeight.w500, color: color),
      headline5: GoogleFonts.poppins(
          fontSize: 24, fontWeight: FontWeight.w400, color: color),
      headline6: GoogleFonts.poppins(
          fontSize: 20, fontWeight: FontWeight.w400, color: color),
      subtitle1: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.normal, color: color),
      subtitle2: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.normal, color: color),
      bodyText1: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.normal, color: color),
      bodyText2: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.normal, color: color),
      caption: GoogleFonts.poppins(
          fontSize: 12, fontWeight: FontWeight.normal, color: color),
      button: GoogleFonts.poppins(
          fontSize: 15, fontWeight: FontWeight.normal, color: color),
      overline: GoogleFonts.poppins(fontSize: 10, color: color));
}
