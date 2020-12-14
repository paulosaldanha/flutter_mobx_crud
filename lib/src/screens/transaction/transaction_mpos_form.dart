import 'package:carousel_pro/carousel_pro.dart';
import 'package:estruturabasica/src/components/bluetooth_modal_widget.dart';
import 'package:estruturabasica/src/components/build_Key_Item_widget.dart';
import 'package:estruturabasica/src/controllers/transaction/transaction_modal_controller.dart';
import 'package:estruturabasica/src/controllers/transaction/transaction_mpos_controller.dart';
import 'package:estruturabasica/src/models/transaction_Mpos.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_payment_method.dart';
import 'package:estruturabasica/src/util/bluetooth_device_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionMposForm extends StatelessWidget {

  TransactionMposController transactionMposController = TransactionMposController();

  TransactionMposForm() {
    BluetoothDeviceService(transactionMposController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(0,74,173, 1),
        title: Text('Transação MPOS - D150'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "R\$ ",
                      style: TextStyle(
                          fontSize: 55.0,
                          color: Color.fromRGBO(0,74,173, 1)),
                    ),
                    Observer(
                      builder: (_) {
                        return Text(
                          '${transactionMposController.currentValues}',
                          style: TextStyle(
                            fontSize: 55.0,
                            color: Color.fromRGBO(0,74,173, 1),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Observer(
                      builder: (_) {
                        return transactionMposController.visibilityModalblueth
                            ? Text(
                                'SEM CONEXÃO COM MAQUININHA',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.red[800],
                                ),
                              )
                            : Text('');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(40),
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: 3,
              children: <Widget>[
                BuildKeyItemWidget("1", transactionMposController),
                BuildKeyItemWidget("2", transactionMposController),
                BuildKeyItemWidget("3", transactionMposController),
                BuildKeyItemWidget("4", transactionMposController),
                BuildKeyItemWidget("5", transactionMposController),
                BuildKeyItemWidget("6", transactionMposController),
                BuildKeyItemWidget("7", transactionMposController),
                BuildKeyItemWidget("8", transactionMposController),
                BuildKeyItemWidget("9", transactionMposController),
                BuildKeyItemWidget("0", transactionMposController),
                BuildKeyItemWidget("00", transactionMposController),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Color.fromRGBO(0,74,173, 1),
                  onPressed: () {
                    transactionMposController.setCurrentValues("clear");
                  },
                  child: Icon(
                    Icons.backspace,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 35.0),
            child: Observer(
              builder: (_) {
                return FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Color.fromRGBO(0,74,173, 1),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  onPressed: transactionMposController.currentValues != "0,00" &&
                      transactionMposController.deviceIsempty()
                      ? () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  TransactionPaymentMethod(transactionMposController)));
                        }
                      : null,
                  child: Text(
                    "Continuar".toUpperCase(),
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                );
              },
            ),
          ),
          Observer(builder: (_) {
            return transactionMposController.visibilityModalblueth
                ? BluetoothModal()
                : Text('');
          }),
        ],
      ),
    );
  }
}
