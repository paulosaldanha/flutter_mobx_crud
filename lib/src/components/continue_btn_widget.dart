import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContinueBtnWidget extends StatelessWidget {

  final controller;
  final router;

  ContinueBtnWidget(this.controller, this.router);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 35.0),
      child: Observer(
        builder: (_) {
          return FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: Color.fromRGBO(0, 74, 173, 1)),
            ),
            color: Colors.white,
            textColor: Color.fromRGBO(0, 74, 173, 1),
            padding: EdgeInsets.all(10.0),
            onPressed: controller.currentValues !=
                "0,00" &&
                controller.deviceIsempty()
                ? () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => router));
            }
                : null,
            child: Text(
              "Continuar".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
