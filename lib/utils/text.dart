import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modified_text extends StatelessWidget {

  final String text;
  final Color color;
  final double size;
  final int maxLines;
  final TextOverflow overflow;

  const modified_text({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    required this.maxLines,
    required this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: GoogleFonts.breeSerif(
        color: color,fontSize: size
      ),

    );
  }
}
