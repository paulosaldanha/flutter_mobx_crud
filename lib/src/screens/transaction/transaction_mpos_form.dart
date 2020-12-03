import 'package:estruturabasica/src/components/build_Key_Item_widget.dart';
import 'package:estruturabasica/src/models/transaction_Mpos.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_payment_method.dart';
import 'package:estruturabasica/src/util/bluetooth_device_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionMposForm extends StatelessWidget {
  final transactionMpos = TransactionMpos();

  TransactionMposForm() {
    BluetoothDeviceService(transactionMpos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transação MPOS - D150'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "R\$ ",
                    style: TextStyle(fontSize: 55.0, color: Colors.blue[800]),
                  ),
                  Observer(
                    builder: (_) {
                      return Text(
                        '${transactionMpos.currentValues}',
                        style: TextStyle(
                          fontSize: 55.0,
                          color: Colors.blue[800],
                        ),
                      );
                    },
                  ),
                ],
              )),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(40),
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: 3,
              children: <Widget>[
                BuildKeyItemWidget("1", transactionMpos),
                BuildKeyItemWidget("2", transactionMpos),
                BuildKeyItemWidget("3", transactionMpos),
                BuildKeyItemWidget("4", transactionMpos),
                BuildKeyItemWidget("5", transactionMpos),
                BuildKeyItemWidget("6", transactionMpos),
                BuildKeyItemWidget("7", transactionMpos),
                BuildKeyItemWidget("8", transactionMpos),
                BuildKeyItemWidget("9", transactionMpos),
                BuildKeyItemWidget("0", transactionMpos),
                BuildKeyItemWidget("00", transactionMpos),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.lightBlue,
                  onPressed: () {
                    transactionMpos.setCurrentValues("clear");
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
                  color: Colors.blueAccent[400],
                  textColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  onPressed: transactionMpos.currentValues != "0,00" && transactionMpos.deviceName != null
                      ? () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  TransactionPaymentMethod(transactionMpos)));
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
        ],
      ),
    );
  }
}
