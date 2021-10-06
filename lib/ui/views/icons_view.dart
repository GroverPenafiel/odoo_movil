import 'package:odoo_movil/ui/cards/white_card.dart';
import 'package:odoo_movil/ui/labels/custom_label.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      physics: ClampingScrollPhysics(),
      children: [
        Text(
          'Icons View',
          style: CustomLabel.h1,
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: [
            WhiteCard(
              title: 'ac_unit_outlined',
              child: Center(child: Icon(Icons.ac_unit_outlined)),
              width: 170,
            ),
            WhiteCard(
              title: 'access_alarm_outlined',
              child: Center(child: Icon(Icons.access_alarm_outlined)),
              width: 170,
            ),
            WhiteCard(
              title: 'sd_card_alert_outlined',
              child: Center(child: Icon(Icons.sd_card_alert_outlined)),
              width: 170,
            ),
            WhiteCard(
              title: 'cabin_outlined',
              child: Center(child: Icon(Icons.cabin_outlined)),
              width: 170,
            ),
            WhiteCard(
              title: 'kayaking_outlined',
              child: Center(child: Icon(Icons.kayaking_outlined)),
              width: 170,
            ),
            WhiteCard(
              title: 'h_mobiledata_outlined',
              child: Center(child: Icon(Icons.h_mobiledata_outlined)),
              width: 170,
            ),
            WhiteCard(
              title: 'g_mobiledata_outlined',
              child: Center(child: Icon(Icons.g_mobiledata_outlined)),
              width: 170,
            ),
            WhiteCard(
              title: 'format_align_justify_outlined',
              child: Center(child: Icon(Icons.format_align_justify_outlined)),
              width: 170,
            ),
            WhiteCard(
              title: 'deck_outlined',
              child: Center(child: Icon(Icons.deck_outlined)),
              width: 170,
            )
          ],
        )
      ],
    ));
  }
}
