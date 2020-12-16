import 'package:carousel_pro/carousel_pro.dart';
import 'package:estruturabasica/src/components/bluetooth_modal_widget.dart';
import 'package:estruturabasica/src/components/build_Key_Item_widget.dart';
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
          Container(
              color: Color.fromRGBO(0, 74, 173, 1),
              padding: EdgeInsets.only(top: 25, bottom: 0, left: 0, right: 0),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "R\$ ",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 74, 173, 1)),
                        ),
                        Observer(
                          builder: (_) {
                            return Text(
                              '${transactionMposController.currentValues}',
                              style: TextStyle(
                                fontSize: 55.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 74, 173, 1),
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
                            return transactionMposController
                                    .visibilityModalBluetooth
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
              )),
          Expanded(
            child: Container(
              color: Colors.white,
              child: GridView.count(
                primary: false,
                padding:
                const EdgeInsets.only(top: 10, right: 40, left: 40, bottom: 0),
                crossAxisSpacing: 0,
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
                  FlatButton(
                    color: Colors.white,
                    onPressed: () {
                      transactionMposController.setCurrentValues("clear");
                    },
                    child: Icon(
                      Icons.backspace,
                      size:35.0,
                      color: Color.fromRGBO(0, 74, 173, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 300,
            height: 100,
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 35.0),
            child: Observer(
              builder: (_) {
                return FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Color.fromRGBO(0, 74, 173, 1)),
                  ),
                  color: Colors.white,
                  textColor: Color.fromRGBO(0, 74, 173, 1),
                  padding: EdgeInsets.all(10.0),
                  onPressed: transactionMposController.currentValues !=
                              "0,00" &&
                          transactionMposController.deviceIsempty()
                      ? () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TransactionPaymentMethod(
                                  transactionMposController)));
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
