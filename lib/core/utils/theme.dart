import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riseup_mail/core/utils/colors.dart';

class CustomTheme {
  ThemeData mainTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: CustomColor.pink,
    textTheme: GoogleFonts.mulishTextTheme(
      TextTheme(
        headline2: GoogleFonts.mulish(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: CustomColor.black,
        ),
        headline4: GoogleFonts.mulish(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: CustomColor.black,
        ),
        headline5: GoogleFonts.mulish(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: CustomColor.black,
        ),
        headline6: GoogleFonts.mulish(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: CustomColor.black,
        ),
        subtitle1: GoogleFonts.mulish(
          fontSize: 14,
          color: CustomColor.black,
        ),
        subtitle2: GoogleFonts.mulish(
          fontSize: 12,
          color: CustomColor.black,
        ),
        bodyText1: GoogleFonts.mulish(
          fontSize: 16,
        ),
        button: GoogleFonts.mulish(
          color: CustomColor.white,
          fontSize: 14,
        ),
      ),
    ),
  );
}
