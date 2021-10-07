import 'dart:async';

import 'package:odoo_movil/providers/auth_odoo_provider.dart';
import 'package:odoo_movil/providers/sidemenu_provider.dart';
import 'package:odoo_movil/router/router.dart';
import 'package:odoo_movil/services/local_storage.dart';
import 'package:odoo_movil/services/navigation_service.dart';
import 'package:odoo_movil/services/notification_service.dart';
import 'package:odoo_movil/ui/layouts/auth/auth_layout.dart';
import 'package:odoo_movil/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:odoo_movil/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await LocalStorage.configurePreferences();
      //DioApi;
      Flurorouter.configureRoutes();
      runApp(AppState());
    },
    (error, st) => print(error),
  );
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthOdooProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CSBP Medical',
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationService.messengerKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthOdooProvider>(context);

        if (authProvider.authStatus == AuthOdooStatus.checking)
          return SplashLayout();

        if (authProvider.authStatus == AuthOdooStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }

        //return AuthLayout(child: child!);
        //return DashboardLayout(child: child!);
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.5)),
        ),
      ),
    );
  }
}
