import 'package:odoo_movil/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinksBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.symmetric(vertical: 7),
        height: 40, //(size.width > 1000) ? size.height * 0.075 : null,
        color: Color(0xFF005b91),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            LinkText(
              text: DateTime.now().year.toString() + ' © CSBP',
              color: Colors.white70,
            ),
            Text(
              '_',
              style: GoogleFonts.roboto(fontSize: 14, color: Colors.white),
            ),
            LinkText(
              text: 'Tecnología e Innovación',
              onPressed: () => print('Hizo click en About'),
              color: Colors.white70,
            ),
          ],
        ));
  }
}
