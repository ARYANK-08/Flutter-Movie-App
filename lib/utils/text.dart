import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const ModifiedText({
    required this.text,
    required this.color,
    required this.size,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}
