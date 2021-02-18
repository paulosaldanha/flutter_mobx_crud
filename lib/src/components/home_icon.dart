import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  HomeIcon(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Icon(
            icon,
            color: Color.fromRGBO(0, 74, 173, 1),
            size: 80,
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black45),
              )
            ],
          ),
        ],
      ),
    );
  }
}
