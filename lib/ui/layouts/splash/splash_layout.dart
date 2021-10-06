import 'package:flutter/material.dart';

class SplashLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[350],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 30,
              ),
              Text('Verificando...')
            ],
          ),
        ),
      ),
    );
  }
}
