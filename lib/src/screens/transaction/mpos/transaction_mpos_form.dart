import 'package:ecommerceBankPay/src/components/bluetooth_modal_widget.dart';
import 'package:ecommerceBankPay/src/components/continue_btn_widget.dart';
import 'package:ecommerceBankPay/src/components/display_value_widget.dart';
import 'package:ecommerceBankPay/src/components/keyboard_widget.dart';
import 'package:ecommerceBankPay/src/controllers/transaction/mpos/transaction_mpos_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionMposForm extends StatelessWidget {
  TransactionMposController transactionMposController =
      TransactionMposController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15, 74, 173, 1),
        title: Text('Transação MPOS - D150'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DisplayValueWidget(
                transactionMposController, '', true),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) {
                    return transactionMposController.validDevice
                        ? Text(
                      'SEM CONEXÃO COM MAQUININHA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[600]
                      ),
                    )
                        : Text('');
                  },
                ),
              ],
            ),
            KeyboardWidget(transactionMposController),
            ContinueBtnWidget(transactionMposController),
            Observer(builder: (_) {
              return !transactionMposController.validDevice
                  ? Text('')
                  : BluetoothModal();
            }),
          ],
        ),
      ),
    );
  }
}
