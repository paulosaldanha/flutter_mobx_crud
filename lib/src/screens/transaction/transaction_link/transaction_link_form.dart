import 'package:estruturabasica/src/controllers/transaction/transaction_link_controller.dart';
import 'package:estruturabasica/src/controllers/transaction_link_controller.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_link/transaction_link_form_part2.dart';
import 'package:estruturabasica/src/components/display_value_widget.dart';
import 'package:estruturabasica/src/components/keyboard_widget.dart';
import 'package:estruturabasica/src/models/transaction_link.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class TransactionLinkForm extends StatelessWidget {
  TransactionLinkForm();
  TransactionLink link = TransactionLink();
  LinkController linkController = LinkController();
  TransactionLinkController transactionLinkController =
      TransactionLinkController();

  List parcelas = [];

  bool _validValue() {
    String value = transactionLinkController.currentValues;
    value = value.replaceAll(",", ".");
    if (double.parse(value) >= 10.00) {
      return true;
    } else {
      return false;
    }
  }

  dynamic getParcelas(value) async {
    dynamic taxas = await getTax(value, 3);
    parcelas = [];
    for (int i = 0; i < taxas.length; i++) {
      dynamic parcela;
      String valor = taxas[i].toStringAsFixed(2).replaceAll(".", ",");
      if (i == 0) {
        parcela = new List();
        parcela.add(i + 1);
        parcela.add("1 Parcela - R\$ ${valor}");
      } else {
        parcela = new List();
        parcela.add(i + 1);
        parcela.add("${i + 1} Parcelas - R\$ ${valor}");
      }
      parcelas.add(parcela);
    }
    return parcelas.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 74, 173, 1),
          title: Text('Gerar Link de Pagamento'),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 25),
            color: Color.fromRGBO(0, 74, 173, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Observer(builder: (_) {
                  return DisplayValueWidget(
                      transactionLinkController, "", false);
                }),
                KeyboardWidget(transactionLinkController),
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
                            ? () async {
                                String value = transactionLinkController
                                    .currentValues
                                    .replaceAll(",", ".");
                                linkController.link.setValue(value);

                                List parcelas = await getParcelas(value);
                                print(parcelas);

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TransactionLinkForm2(
                                        linkController, link, parcelas)));
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
                )
              ],
            )));
  }
}
