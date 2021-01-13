import 'package:estruturabasica/src/components/display_value_widget.dart';
import 'package:estruturabasica/src/components/keyboard_widget.dart';
import 'package:estruturabasica/src/controllers/transaction/boleto/transaction_boleto_controller.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class TransactionBoletoForm2 extends StatelessWidget {
  final boleto;
  final boletoController;

  TransactionBoletoForm2(this.boletoController, this.boleto);

  TransactionBoletoController transactionBoletoController =
      TransactionBoletoController();

  bool _validValue() {
    String value = transactionBoletoController.currentValues;
    value = value.replaceAll(",", ".");
    if (double.parse(value) >= 10.00 && !boletoController.loading) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 74, 173, 1),
          title: Text('Gerar Boleto'),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 25),
            color: Color.fromRGBO(0, 74, 173, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Observer(builder: (_) {
                  return DisplayValueWidget(
                      transactionBoletoController,
                      "Taxa R\$ " +
                          transactionBoletoController.currentValuesTax
                              .toStringAsFixed(2)
                              .replaceAll(".", ","),
                      false);
                }),
                KeyboardWidget(transactionBoletoController),
                Container(
                  width: 1000,
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(top: 10, right: 35, left: 35, bottom: 35),
                  child: Observer(
                    builder: (_) {
                      return FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side:
                              BorderSide(color: Color.fromRGBO(0, 74, 173, 1)),
                        ),
                        color: Colors.white,
                        textColor: Color.fromRGBO(0, 74, 173, 1),
                        padding: EdgeInsets.all(10.0),
                        onPressed: _validValue()
                            ? () {
                                String value = transactionBoletoController
                                    .currentValues
                                    .replaceAll(",", ".");
                                String valueTax = transactionBoletoController
                                    .currentValuesTax
                                    .toString();
                                boletoController.boleto.setValue(value);
                                boletoController.boleto.setValueTax(valueTax);
                                boletoController.loading = true;
                                boletoController
                                    .createTransctionBoleto()
                                    .then((value) {
                                  boletoController.loading = false;
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => TransactionResponse(
                                          value, "boleto")));
                                });
                              }
                            : null,
                        child: Observer(
                          builder: (_) {
                            return !boletoController.loading
                                ? Text(
                                    "Continuar".toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(),
                                  );
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            )));
  }
}
