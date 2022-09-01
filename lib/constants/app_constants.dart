import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const MaterialColor primaryColor =
      Colors.indigo; //const'lar derleme aşamsında sabitleri oluşturur

  static const String titleText = "Gpa Calculator";

  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: primaryColor); //final ise run time da sabitleri oluşturur

  static BorderRadius borderRadius = BorderRadius.circular(20);

  static final TextStyle bodyStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor);

  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: primaryColor);

  static final EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final EdgeInsets horizantalPadding =
      EdgeInsets.symmetric(horizontal: 8);
}
