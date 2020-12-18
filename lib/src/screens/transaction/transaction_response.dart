import 'package:estruturabasica/src/controllers/transaction/transaction_boleto_controller.dart';
import 'package:estruturabasica/src/components/response_widget.dart';
import 'package:estruturabasica/src/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class TransactionResponse extends StatelessWidget {
  final boleto;
  final boletoController;

  TransactionResponse(this.boletoController, this.boleto);
  TransactionBoletoController transactionBoletoController =
      TransactionBoletoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          color: Colors.white,
          child: Observer(builder: (_) {
            return ResponseWidget(boletoController, false);
          })),
      SizedBox(height: 30),
      Container(
        width: 1000,
        color: Colors.white,
        padding: EdgeInsets.only(top: 10, right: 35, left: 35, bottom: 35),
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
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text(
                "Início",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            );
          },
        ),
      ),
    ]));
  }
}
