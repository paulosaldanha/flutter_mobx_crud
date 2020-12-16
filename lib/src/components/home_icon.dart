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
            color: Color.fromRGBO(0, 74, 173, 1),
            size: 120.0,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
              color: Color.fromRGBO(0, 74, 173, 1),),
          ),
        ],
      ),
    );
  }
}
