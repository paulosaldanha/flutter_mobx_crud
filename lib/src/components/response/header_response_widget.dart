import 'package:flutter/material.dart';

class HeaderResponseWidget extends StatelessWidget {
  final response;
  final error;
  final method;

  HeaderResponseWidget(this.response, this.error, this.method);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 250,
      color: (error) ? Colors.red[900] : Colors.lightGreen,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(height: 30),
        Text((error) ? "Ocorreu um erro" : "Você já pode enviar o comprovante",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center),
        SizedBox(height: 30),
        (error)
            ? Text("")
            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Total: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
                Text(
                    (method == "boleto")
                        ? "R\$ " +
                            response["valorBruto"]
                                .toStringAsFixed(2)
                                .replaceAll(".", ",")
                        : "R\$ " +
                            response["valor"]
                                .toStringAsFixed(2)
                                .replaceAll(".", ","),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
              ]),
      ]),
    );
  }
}
