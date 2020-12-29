import 'package:combos/combos.dart';
import 'package:estruturabasica/src/components/alert_confirm.dart';
import 'package:estruturabasica/src/components/alert_listCombo.dart';
import 'package:estruturabasica/src/components/stateless_modal_widget.dart';
import 'package:estruturabasica/src/controllers/transaction/transaction_list_combo_controller.dart';
import 'package:estruturabasica/src/controllers/transaction/transaction_modal_controller.dart';
import 'package:estruturabasica/src/models/tax.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class TransactionPaymentMethod extends StatelessWidget {
  final transactionMposController;
  TransactionModalController transactionModal =
      new TransactionModalController();
  TransactionListComboController listComboController =
      new TransactionListComboController();

  TransactionPaymentMethod(this.transactionMposController) {
    listComboController.getTaxCredit(transactionMposController.currentValues);
    listComboController.getTaxDebit(transactionMposController.currentValues);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        title: Text('Selecione metodo de pagamento'),
      ),
      body: Observer(
        builder: (_) {
          return listComboController.amountValuesCreditCardList == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        color: Color.fromRGBO(0, 74, 173, 1),
                        padding: EdgeInsets.symmetric(vertical: 100.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Total a receber lojista:',
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.white),
                                ),
                                Text(
                                  'R\$ ${transactionMposController.currentValues}',
                                  style: TextStyle(
                                    fontSize: 50.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                transactionMposController
                                    .setPaymentMethod('credito');
                                var retorno = await showAlertConfirmListCombo(
                                    context,
                                    "Selecione uma parcela",
                                    listComboController,
                                    'credito');
                                if (retorno == 1) {
                                  transactionMposController.setInstallments(
                                      listComboController
                                          .installmentsComboList);
                                  transactionMposController.setAmount(
                                      listComboController.amountComboList);
                                  transactionMposController.initPlatformState(
                                      transactionModal, context);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(30.0),
                                color: Color.fromRGBO(0, 74, 173, 1),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.credit_card_outlined,
                                      color: Colors.lime,
                                      size: 40,
                                    ),
                                    Text(
                                      'Cartão de crédito',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                transactionMposController
                                    .setPaymentMethod('debito');
                                var retorno = await showAlertConfirmListCombo(
                                    context,
                                    "Selecione uma parcela",
                                    listComboController,
                                    'debito');
                                if (retorno == 1) {
                                  transactionMposController.initPlatformState(
                                      transactionModal, context);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(30.0),
                                color: Color.fromRGBO(0, 74, 173, 1),
                                child: Column(
                                  children: [
                                    Icon(Icons.credit_card_outlined,
                                        size: 40,
                                        color: Colors.tealAccent[700]),
                                    Text(
                                      'Cartão de Débito',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 200.0,
                                width: 250.0,
                                child: Observer(
                                  builder: (_) {
                                    if (transactionModal.status == 1) {
                                      return StatlessModal(transactionModal);
                                    } else {
                                      return Text('');
                                    }
                                  },
                                )),
                          ],
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
