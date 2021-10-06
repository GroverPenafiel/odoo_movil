import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
        height: 30,
        width: 30,
      ),
    );
  }
}
