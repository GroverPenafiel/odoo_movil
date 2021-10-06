import 'package:odoo_movil/providers/auth_odoo_provider.dart';
import 'package:odoo_movil/ui/cards/white_card.dart';
import 'package:odoo_movil/ui/labels/custom_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthOdooProvider>(context).user!;
    return Container(
        child: ListView(
      physics: ClampingScrollPhysics(),
      children: [
        Text(
          'Dashboard View',
          style: CustomLabel.h1,
        ),
        SizedBox(
          height: 10,
        ),
        WhiteCard(
            title: authProvider.nombreCompleto == ''
                ? ''
                : authProvider.nombreCompleto,
            child: Text(authProvider.correoElectronico))
      ],
    ));
  }
}
