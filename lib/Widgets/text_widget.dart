import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poojagoodie_app/core/consts.dart';

Widget textWidget(
    {required String text,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    Color color = bc}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.poppins(
        fontSize: fontSize, fontWeight: fontWeight, color: color),
  );
}
