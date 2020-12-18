import 'package:carousel_pro/carousel_pro.dart';
import 'package:estruturabasica/src/components/bluetooth_modal_widget.dart';
import 'package:estruturabasica/src/components/build_Key_Item_widget.dart';
import 'package:estruturabasica/src/components/continue_btn_widget.dart';
import 'package:estruturabasica/src/components/display_value_widget.dart';
import 'package:estruturabasica/src/components/keyboard_widget.dart';
import 'package:estruturabasica/src/controllers/transaction/transaction_modal_controller.dart';
import 'package:estruturabasica/src/controllers/transaction/transaction_mpos_controller.dart';
import 'package:estruturabasica/src/models/transaction_Mpos.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_payment_method.dart';
import 'package:estruturabasica/src/util/bluetooth_device_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionMposForm extends StatelessWidget {
  TransactionMposController transactionMposController =
      TransactionMposController();

  TransactionMposForm() {
    BluetoothDeviceService(transactionMposController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15, 74, 173, 1),
        title: Text('Transação MPOS - D150'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DisplayValueWidget(
              transactionMposController, 'SEM CONEXÃO COM MAQUININHA', true),
          KeyboardWidget(transactionMposController),
          ContinueBtnWidget(transactionMposController,
              TransactionPaymentMethod(transactionMposController)),
          Observer(builder: (_) {
            return transactionMposController.visibilityModalBluetooth
                ? BluetoothModal()
                : Text('');
          }),
        ],
      ),
    );
  }
}
