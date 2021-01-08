import 'package:estruturabasica/src/components/bluetooth_modal_widget.dart';
import 'package:estruturabasica/src/components/continue_btn_widget.dart';
import 'package:estruturabasica/src/components/display_value_widget.dart';
import 'package:estruturabasica/src/components/keyboard_widget.dart';
import 'package:estruturabasica/src/controllers/transaction/transaction_mpos_controller.dart';
import 'package:estruturabasica/src/util/bluetooth_device_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionMposForm extends StatelessWidget {
  TransactionMposController transactionMposController =
      TransactionMposController();

  @override
  Widget build(BuildContext context) {
    BluetoothDeviceService(transactionMposController);
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
                transactionMposController, 'SEM CONEXÃO COM MAQUININHA', true),
            KeyboardWidget(transactionMposController),
            ContinueBtnWidget(transactionMposController),
            Observer(builder: (_) {
              return transactionMposController.visibilityModalBluetooth
                  ? BluetoothModal()
                  : Text('');
            }),
          ],
        ),
      ),
    );
  }
}
