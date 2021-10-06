import 'package:odoo_movil/providers/sidemenu_provider.dart';
import 'package:odoo_movil/ui/shared/widgets/navbar_avatar.dart';
import 'package:odoo_movil/ui/shared/widgets/notifications_indicator.dart';
import 'package:odoo_movil/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700)
            IconButton(
              onPressed: () => SideMenuProvider.openMenu(),
              icon: Icon(Icons.menu_outlined),
            ),
          SizedBox(width: 5),
          if (size.width > 400)
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: SearchText(),
            ),
          Spacer(),
          NotificationIndicator(),
          SizedBox(width: 10),
          NavbarAvatar(),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
