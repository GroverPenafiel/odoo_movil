import 'package:odoo_movil/providers/sidemenu_provider.dart';
import 'package:odoo_movil/router/router.dart';
import 'package:odoo_movil/services/navigation_service.dart';
import 'package:odoo_movil/ui/shared/widgets/logo.dart';
import 'package:odoo_movil/ui/shared/widgets/menu_item.dart';
import 'package:odoo_movil/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(height: 50),
          TextSeparator(text: 'Menú'),
          MenuItem(
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
              text: 'Inicio',
              icon: Icons.home_outlined,
              onPressed: () => navigateTo(Flurorouter.dashboardRoute)),
          MenuItem(
              text: 'Encuestas',
              icon: Icons.analytics_outlined,
              onPressed: () {}),
          MenuItem(
              text: 'Contactenos', icon: Icons.contact_page, onPressed: () {}),
          SizedBox(height: 30),
          TextSeparator(text: '-------------'),
          MenuItem(
              isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
              text: 'Salir',
              icon: Icons.logout_outlined,
              onPressed: () => navigateTo(Flurorouter.iconsRoute)),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      gradient: LinearGradient(colors: [Color(0xff1E1F21), Color(0xff1E1F18)]),
      boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 10)]);
}
//#212225
//#1E1F21