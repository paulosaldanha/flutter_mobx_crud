import 'package:estruturabasica/src/components/alert_listCombo.dart';
import 'package:estruturabasica/src/components/display_value_widget.dart';
import 'package:estruturabasica/src/components/keyboard_widget.dart';
import 'package:estruturabasica/src/controllers/transaction/transaction_list_combo_controller.dart';
import 'package:estruturabasica/src/controllers/transaction_online_part2_controller.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_online_form_part3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class TransactionOnlineFormPart2 extends StatelessWidget {
  final transactiononline;
  final transactiononlineController;

  TransactionOnlineFormPart2(
      this.transactiononline, this.transactiononlineController);

  @override
  Widget build(BuildContext context) {

    TransactionListComboController listComboController =
    new TransactionListComboController();

    TransactionOnlinePart2Controller transactionOnlinePart2Controller =
        new TransactionOnlinePart2Controller(transactiononline);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        title: Text('Criar transação - Online'),
      ),
      body: Observer(
        builder: (_) {
          return listComboController.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      DisplayValueWidget(
                          transactionOnlinePart2Controller, '', false),
                      KeyboardWidget(transactionOnlinePart2Controller),
                      Observer(
                        builder: (_) {
                          return Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(30),
                            child: ButtonTheme(
                                minWidth: 1000,
                                child: RaisedButton(
                                    disabledColor: Colors.grey[200],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: BorderSide(
                                          color: Color.fromRGBO(0, 74, 173, 1)),
                                    ),
                                    color: Colors.white,
                                    onPressed: transactionOnlinePart2Controller
                                                .currentValues !=
                                            "0,00"
                                        ? () async {
                                      listComboController.selectedString = "SELECIONE UM PARCELA";
                                            listComboController.getTaxCredit(
                                                transactionOnlinePart2Controller
                                                    .currentValues);
                                              var retorno =
                                                  await showAlertConfirmListCombo(
                                                      context,
                                                      "Selecione uma parcela",
                                                      listComboController,
                                                      'credito');
                                              if (retorno == 1) {
                                                transactiononlineController
                                                    .transactiononline
                                                    .setValue(
                                                        listComboController
                                                            .amountComboList);
                                                transactiononlineController
                                                    .transactiononline
                                                    .setInstallments(
                                                        listComboController
                                                            .installmentsComboList);
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TransactionOnlineFormPart3(
                                                                transactiononline,
                                                                transactiononlineController)));
                                              }
                                            }
                                        : null,
                                    child: Container(
                                      height: 70,
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        "Continue",
                                        style: TextStyle(
                                          color: Color.fromRGBO(0, 74, 173, 1),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ))),
                          );
                        },
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

_textField({String labelText, onChanged, String Function() errorText}) {
  return TextFormField(
    onChanged: onChanged,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText()),
  );
}

_numberField(
    {String labelText,
    onChanged,
    String Function() errorText,
    String prefix,
    bool enable}) {
  return TextFormField(
    keyboardType: TextInputType.number,
    onChanged: onChanged,
    enabled: enable,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
        prefixText: prefix),
  );
}
