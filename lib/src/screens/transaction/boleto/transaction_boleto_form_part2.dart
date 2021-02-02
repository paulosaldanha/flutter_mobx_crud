import 'package:estruturabasica/src/components/display_value_widget.dart';
import 'package:estruturabasica/src/components/keyboard_widget.dart';
import 'package:estruturabasica/src/controllers/transaction/boleto/transaction_boleto_controller.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_response.dart';
import 'package:estruturabasica/src/util/show_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class TransactionBoletoForm2 extends StatefulWidget {
  final boletoController;
  TransactionBoletoForm2(this.boletoController);

  @override
  _TransactionBoletoForm2State createState() => _TransactionBoletoForm2State(boletoController);
}

class _TransactionBoletoForm2State extends State<TransactionBoletoForm2> {
  final boletoController;
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => boletoController.requestCreate.status, (_) async {
      if (boletoController.requestCreate?.status == FutureStatus.fulfilled) {
        boletoController.clear();
        print(boletoController.requestCreate.value);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TransactionResponse(
                boletoController.requestCreate.value , "boleto")));
      }
      if (boletoController.requestCreate?.status == FutureStatus.rejected) {
        showError(boletoController.requestCreate.error, context);
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  _TransactionBoletoForm2State(this.boletoController);

  TransactionBoletoController transactionBoletoController =
      TransactionBoletoController();

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
                        onPressed: transactionBoletoController.validValue
                            ? () {
                                transactionBoletoController.loading = true;
                                String value = transactionBoletoController
                                    .currentValues
                                    .replaceAll(",", ".");
                                String valueTax = transactionBoletoController
                                    .currentValuesTax
                                    .toString();
                                boletoController.boleto.setValue(value);
                                boletoController.boleto.setValueTax(valueTax);
                                boletoController
                                    .createTransctionBoleto();
                              }
                            : null,
                        child: Observer(
                          builder: (_) {
                            return !boletoController.isLoadingRequestCreate
                                ? Text(
                                    "Continuar".toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                    ),
                                  )
                                : Center(
                                    child: SizedBox(
                                      child: CircularProgressIndicator(),
                                    ),
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
