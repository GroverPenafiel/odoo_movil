import 'package:odoo_movil/ui/cards/white_card.dart';
import 'package:odoo_movil/ui/labels/custom_label.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      physics: ClampingScrollPhysics(),
      children: [
        Text(
          'Blank View',
          style: CustomLabel.h1,
        ),
        SizedBox(
          height: 10,
        ),
        WhiteCard(title: 'title', child: Text('data'))
      ],
    ));
  }
}
