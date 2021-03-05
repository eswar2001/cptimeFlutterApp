import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class button extends StatelessWidget {
  final String s;
  button(this.s);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        type: MaterialType.card,
        shadowColor: Colors.grey,
        elevation: 3.0,
        color: Colors.grey[900],
        child: ListTile(
          leading: Text(s.toUpperCase(),
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal)),
          tileColor: Colors.blueAccent,
          contentPadding: EdgeInsets.all(5.0),
          trailing: OutlinedButton(
            clipBehavior: Clip.antiAlias,
            style: OutlinedButton.styleFrom(
                visualDensity: VisualDensity.comfortable,
                backgroundColor: Colors.black87,
                shadowColor: Colors.grey),
            onPressed: () {
              Navigator.pushNamed(context, '/$s');
            },
            child: Text('Show List',
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18.0)),
          ),
        ),
      ),
    );
  }
}
