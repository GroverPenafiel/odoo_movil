import 'package:odoo_movil/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      elevation: 5,
      child: Container(
          height: 43,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          color: Color(0xFF00193f),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              /*LinkText(
                  text: 'About', onPressed: () => print('Hizo click en About')),*/
              Container(
                  child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Image.asset(
                    'assets/csbp.png',
                    width: 25,
                    height: 25,
                  ),
                  LinkText(
                    text: ' Caja de Salud de la Banca Privada',
                    color: Colors.white70,
                  ),
                ],
              )),
              // LinkText(
              //   text: 'Crear una cuenta',
              //   color: Colors.white54,
              // ),
            ],
          )),
    );
  }
}
