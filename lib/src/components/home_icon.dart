import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  final IconData icon;
  final String text ;

  HomeIcon(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 90.0,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
