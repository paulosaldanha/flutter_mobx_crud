import 'package:flutter/material.dart';

class ResponseWidget extends StatelessWidget {
  final controller;
  final error;

  ResponseWidget(this.controller, this.error);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 1000,
        height: 300,
        alignment: Alignment.center,
        color: (error) ? Colors.red[900] : Colors.lightGreen,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text("Você já pode enviar o comprovante",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
              SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Total: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
                Text("R\$ 100,00",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
              ]),
            ]),
      ),
      SizedBox(height: 50),
      Container(
        width: 1000,
        color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Column(
              children: [
                RaisedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.message),
                    label: Text("")),
                Text("Enviar por e-mail")
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                RaisedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.message),
                    label: Text("")),
                Text("Enviar por WhatsAppp")
              ],
            ),
          ),
        ]),
      ),
    ]);
  }
}
