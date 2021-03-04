import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class button extends StatelessWidget {
  final String s;
  button(this.s);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.indigo,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/$s');
      },
      child: Text('$s',
          style: GoogleFonts.roboto(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w500)),
    );
  }
}
