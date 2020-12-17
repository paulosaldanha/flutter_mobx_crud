import 'package:flutter/material.dart';

import 'home_icon.dart';

class HomeCardGrid extends StatelessWidget {
  final router;
  final icon;
  final title;

  HomeCardGrid(this.router, this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => router));
        },
        child: Column(
          children: [
            HomeIcon(
               icon, title),
          ],
        ),
      ),
    );
  }
}
