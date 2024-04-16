import 'package:e_shop/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle myTexStyle(
    {double fontSize = 16, FontWeight fontWeight = FontWeight.w300, Color color = secondaryTextColor}) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
  );
}
