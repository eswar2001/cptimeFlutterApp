import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class button extends StatelessWidget {
  final String s;
  button(this.s);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: OutlinedButton(
        clipBehavior: Clip.antiAlias,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.grey[600],
          minimumSize: Size(190.0, 190.0),
          visualDensity: VisualDensity.comfortable,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/$s');
        },
        child: Text(
          s[0].toUpperCase() + s.substring(1),
          style: GoogleFonts.openSans(
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
