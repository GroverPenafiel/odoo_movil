import 'package:odoo_movil/providers/sidemenu_provider.dart';
import 'package:odoo_movil/ui/shared/navbar.dart';
import 'package:odoo_movil/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  _DashboardLayoutState createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SideMenuProvider.menuController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFEDf1f2),
        body: SafeArea(
          child: Stack(
            children: [
              Row(
                children: [
                  if (size.width >= 700) Sidebar(),
                  // Sidebar

                  Expanded(
                      child: Column(
                    children: [
                      // NAVBAR
                      Navbar(),
                      // Contenedor de nuestro view
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: widget.child),
                      )
                    ],
                  ))
                ],
              ),
              if (size.width < 700)
                AnimatedBuilder(
                  animation: SideMenuProvider.menuController,
                  builder: (context, _) => Stack(
                    children: [
                      if (SideMenuProvider.isOpen)
                        Opacity(
                          opacity: SideMenuProvider.opacity.value,
                          child: GestureDetector(
                            onTap: () => SideMenuProvider.closeMenu(),
                            child: Container(
                              width: size.width,
                              height: size.height,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      Transform.translate(
                        offset: Offset(SideMenuProvider.movement.value, 0),
                        child: Sidebar(),
                      )
                    ],
                  ),
                )
            ],
          ),
        ));
  }
}
