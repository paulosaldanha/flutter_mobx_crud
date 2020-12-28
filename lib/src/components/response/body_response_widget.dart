import 'package:flutter/material.dart';
import 'package:estruturabasica/presentation/ecommerce_bank_pay_icons.dart';

class BodyResponseWidget extends StatelessWidget {
  final response;
  final error;

  BodyResponseWidget(this.response, this.error);

  @override
  Widget build(BuildContext context) {
    if (error) {
      return Container(
        child: Column(children: [
          Text("Verifique os dados do cartão e tente novamente",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
              textAlign: TextAlign.center)
        ]),
      );
    } else {
      return Container(
        child: Column(children: [
          Row(children: [
            Expanded(
                child: Column(children: [
              IconButton(
                icon: Icon(Ecommerce_bank_pay.mail),
                iconSize: 90,
                color: Color.fromRGBO(0, 74, 173, 1),
                tooltip: 'Enviar por e-mail',
                onPressed: () {
                  print("E-mail");
                },
              ),
              Text("Enviar por \n e-mail",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                  textAlign: TextAlign.center)
            ])),
            Expanded(
                child: Column(children: [
              IconButton(
                icon: Icon(Ecommerce_bank_pay.whatsapp),
                iconSize: 80,
                color: Color.fromRGBO(0, 74, 173, 1),
                tooltip: 'Enviar por WhatsApp',
                onPressed: () {
                  print("WhatsApp");
                },
              ),
              Text("Enviar por \n WhatsApp",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                  textAlign: TextAlign.center)
            ])),
          ]),
          SizedBox(height: 50),
          Column(children: [
            Text(
                "R\$ " +
                    response["valor"].toStringAsFixed(2).replaceAll(".", ","),
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Text("Já está na sua carteira",
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))
          ])
        ]),
      );
    }
  }
}
