import 'package:flutter/material.dart';

class ButtonResponseWidget extends StatelessWidget {
  final error;

  ButtonResponseWidget(this.error);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1000,
        padding: EdgeInsets.only(top: 10, right: 35, bottom: 10, left: 35),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(color: Color.fromRGBO(0, 74, 173, 1)),
          ),
          color: Colors.white,
          textColor: Color.fromRGBO(0, 74, 173, 1),
          padding: EdgeInsets.all(10.0),
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
          child: Text(
            (error) ? "Voltar" : "Início",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ));
  }
}
