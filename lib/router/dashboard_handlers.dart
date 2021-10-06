import 'package:odoo_movil/providers/auth_odoo_provider.dart';
import 'package:odoo_movil/providers/sidemenu_provider.dart';
import 'package:odoo_movil/router/router.dart';
import 'package:odoo_movil/ui/views/blank_view.dart';
import 'package:odoo_movil/ui/views/icons_view.dart';
import 'package:odoo_movil/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:odoo_movil/ui/views/dashboard/dashboard_view.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthOdooProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);
    if (authProvider.authStatus == AuthOdooStatus.authenticated)
      return DashboardView();
    else {
      return LoginView();
    }
  });

  static Handler icons = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthOdooProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);

    if (authProvider.authStatus == AuthOdooStatus.authenticated)
      return IconsView();
    else {
      return LoginView();
    }
  });

  static Handler blank = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthOdooProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute);

    if (authProvider.authStatus == AuthOdooStatus.authenticated)
      return BlankView();
    else {
      return LoginView();
    }
  });
}
