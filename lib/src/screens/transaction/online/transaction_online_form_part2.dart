import 'package:estruturabasica/src/components/alert_listCombo.dart';
import 'package:estruturabasica/src/components/display_value_widget.dart';
import 'package:estruturabasica/src/components/keyboard_widget.dart';
import 'package:estruturabasica/src/controllers/transaction/mpos/transaction_list_combo_controller.dart';
import 'package:estruturabasica/src/controllers/transaction/online/transaction_online_part2_controller.dart';
import 'package:estruturabasica/src/screens/transaction/online/transaction_online_form_part3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionOnlineFormPart2 extends StatefulWidget {
  final transactionOnline;
  final transactionOnlineController;

  const TransactionOnlineFormPart2(
      this.transactionOnline, this.transactionOnlineController);

  @override
  _TransactionOnlineFormPart2State createState() =>
      _TransactionOnlineFormPart2State(
          this.transactionOnline, this.transactionOnlineController);
}

class _TransactionOnlineFormPart2State
    extends State<TransactionOnlineFormPart2> {
  final transactionOnline;
  final transactionOnlineController;

  _TransactionOnlineFormPart2State(
      this.transactionOnline, this.transactionOnlineController);

  @override
  Widget build(BuildContext context) {
    TransactionListComboController listComboController =
        new TransactionListComboController();

    TransactionOnlinePart2Controller transactionOnlinePart2Controller =
        new TransactionOnlinePart2Controller(transactionOnline);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        title: Text('Criar transação online'),
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
                      Container(
                        width: 1000,
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            top: 10, right: 20, left: 20, bottom: 35),
                        child: Observer(
                          builder: (_) {
                            return FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 74, 173, 1)),
                              ),
                              color: Colors.white,
                              textColor: Color.fromRGBO(0, 74, 173, 1),
                              padding: EdgeInsets.all(10.0),
                              onPressed: transactionOnlinePart2Controller
                                          .currentValues !=
                                      "0,00"
                                  ? () async {
                                      listComboController.selectedString =
                                          "SELECIONE UM PARCELA";
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
                                        transactionOnlineController
                                            .transactionOnline
                                            .setValue(listComboController
                                                .amountComboList);
                                        transactionOnlineController
                                            .transactionOnline
                                            .setInstallments(listComboController
                                                .installmentsComboList);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TransactionOnlineFormPart3(
                                                        transactionOnline,
                                                        transactionOnlineController)));
                                      }
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
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
