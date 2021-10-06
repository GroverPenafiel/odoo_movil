import 'package:odoo_movil/providers/auth_odoo_provider.dart';
import 'package:odoo_movil/ui/views/dashboard/dashboard_view.dart';
import 'package:fluro/fluro.dart';
import 'package:odoo_movil/ui/views/login_view.dart';
import 'package:odoo_movil/ui/views/register_view.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthOdooProvider>(context!);
    if (authProvider.authStatus == AuthOdooStatus.notAuthenticated)
      return LoginView();
    else
      return DashboardView();
  });

  static Handler register = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthOdooProvider>(context!);
    if (authProvider.authStatus == AuthOdooStatus.notAuthenticated)
      return RegisterView();
    else
      return DashboardView();
  });
}
