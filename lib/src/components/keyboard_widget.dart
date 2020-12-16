import 'package:estruturabasica/src/components/build_Key_Item_widget.dart';
import 'package:flutter/material.dart';

class KeyboardWidget extends StatelessWidget {
  final controller;

  KeyboardWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        color: Colors.white,
        child: GridView.count(
          primary: false,
          padding:
          const EdgeInsets.only(top: 10, right: 40, left: 40, bottom: 0),
          crossAxisSpacing: 0,
          mainAxisSpacing: 1,
          crossAxisCount: 3,
          children: <Widget>[
            BuildKeyItemWidget("1", controller),
            BuildKeyItemWidget("2", controller),
            BuildKeyItemWidget("3", controller),
            BuildKeyItemWidget("4", controller),
            BuildKeyItemWidget("5", controller),
            BuildKeyItemWidget("6", controller),
            BuildKeyItemWidget("7", controller),
            BuildKeyItemWidget("8", controller),
            BuildKeyItemWidget("9", controller),
            BuildKeyItemWidget("0", controller),
            BuildKeyItemWidget("00", controller),
            FlatButton(
              color: Colors.white,
              onPressed: () {
                controller.setCurrentValues("clear");
              },
              child: Icon(
                Icons.backspace,
                size:35.0,
                color: Color.fromRGBO(0, 74, 173, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
