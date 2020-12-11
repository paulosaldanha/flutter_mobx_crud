import 'package:combos/combos.dart';
import 'package:estruturabasica/src/components/alert_confirm.dart';
import 'package:estruturabasica/src/components/alert_listCombo.dart';
import 'package:estruturabasica/src/components/stateless_modal_widget.dart';
import 'package:estruturabasica/src/controllers/transaction_mpos_controller.dart';
import 'package:estruturabasica/src/models/taxa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class TransactionPaymentMethod extends StatelessWidget {
  final transactionMpos;

  TransactionPaymentMethod(this.transactionMpos){
    transactionMpos.getTaxasCredit();
    transactionMpos.getTaxasDebit();
  }

  TransactionMposController transactionController =
      new TransactionMposController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0,74,173, 1),
        title: Text('Selecione metodo de pagamento'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.grey[300],
              padding: EdgeInsets.symmetric(vertical: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Total a receber lojista:',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Color.fromRGBO(0,74,173, 1)),
                      ),
                      Text(
                        'R\$ ${transactionMpos.currentValues}',
                        style: TextStyle(
                          fontSize: 50.0,
                          color: Color.fromRGBO(0,74,173, 1),
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
                      transactionMpos.setPaymentMethod(
                          'credito', transactionController);
                      var retorno = await showAlertConfirmListCombo(
                          context,
                          "Selecione uma parcela",
                          transactionMpos, 'credito');
                      if (retorno == 1) {
                        transactionMpos.initPlatformState(transactionController, context);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30.0),
                      color: Colors.grey[300],
                      child: Column(
                        children: [
                          Icon(Icons.credit_card_outlined,
                              color: Colors.deepPurpleAccent),
                          Text('Cartão de crédito'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      transactionMpos.setPaymentMethod(
                          'debito', transactionController);
                      var retorno = await showAlertConfirmListCombo(
                          context,
                          "Selecione uma parcela",
                          transactionMpos, 'debito');
                      if (retorno == 1) {
                        transactionMpos.initPlatformState(transactionController, context);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30.0),
                      color: Colors.grey[300],
                      child: Column(
                        children: [
                          Icon(Icons.credit_card_outlined,
                              color: Colors.tealAccent[700]),
                          Text('Cartão de Débito'),
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
                          if (transactionController.status == 1) {
                            return StatlessModal(transactionController);
                          }else {
                            return Text('');
                          }
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
