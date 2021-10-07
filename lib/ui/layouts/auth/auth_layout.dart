import 'package:odoo_movil/ui/layouts/auth/widgets/auth_header.dart';
import 'package:odoo_movil/ui/layouts/auth/widgets/auth_left.dart';
import 'package:odoo_movil/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          //isAlwaysShown: true,
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              AuthHeader(),
              //Un container que simula ela sobmra de arriba
              Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(color: Colors.black),
                    BoxShadow(
                        color: Color(0xFF00193f), //Color(0xFF37393e),
                        spreadRadius: 20.0,
                        blurRadius: 20.0,
                        offset: Offset(0, 15)),
                  ]),
                  child: Container(
                      width: double.infinity,
                      height: 20) // child widget, replace with your own
                  ),
              (size.width > 1000)
                  //Desktop
                  ? _DesktopBody(child: child)
                  //Movil
                  : _MobileBody(child: child),
              //Links
              LinksBar()
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //color: Color(0xFF37393e),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [Color(0xFF00193f), Color(0xFF005b91)],
          stops: [0, 1],
        ),
      ),
      height: size.height - 127, //103,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //SizedBox(height: 20),
          //CustomTitle(),
          SizedBox(height: 20),
          Expanded(
            child: child,
          ),
          // Container(
          //   width: double.infinity,
          //   height: 400,
          //   child: Background(),
          // )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [Color(0xFF00193f), Color(0xFF005b91)],
          stops: [0, 1],
        ),
      ),
      width: size.width,
      height: size.height - 103,
      //color: Color(0xFF37393e),
      child: Row(
        children: [
          //Twitter Background
          AuthLeft(),
          // View Container
          Container(
            width: 600,
            height: double.infinity,
            //color: Color(0xFF37393e),
            child: Column(
              children: [
                //CustomTitle(),
                SizedBox(height: 10),
                Expanded(child: child)
              ],
            ),
          )
        ],
      ),
    );
  }
}
