import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school360/constants/colors.dart';

TextStyle defaultTS = GoogleFonts.getFont(
  'Ubuntu Condensed',
  textStyle: TextStyle(
    color: secondaryColor,
    fontSize: 15,
  ),
);

TextStyle headerTS = GoogleFonts.getFont(
  'Fredoka One',
  textStyle: TextStyle(
    color: secondaryColor,
    fontSize: 25,
  ),
);

TextStyle parmanentMarker = GoogleFonts.getFont(
  'Permanent Marker',
  textStyle: TextStyle(
    color: secondaryColor.withOpacity(.7),
    fontSize: 25,
  ),
);
