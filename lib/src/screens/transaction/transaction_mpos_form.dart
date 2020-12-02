import 'package:estruturabasica/src/components/build_Key_Item_widget.dart';
import 'package:estruturabasica/src/controllers/transaction_mpos_controller.dart';
import 'package:estruturabasica/src/models/transaction_Mpos.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_payment_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionMposForm extends StatelessWidget {

  final transactionMpos = TransactionMpos();
  // PagarmeMpos mpos = new PagarmeMpos();
  //
  // Future<void> initPlatformState() async {
  //   DeviceService device = new DeviceService(
  //       deviceName: 'PAX-7L840180',
  //       amount: 1000,
  //       installments: 2,
  //       paymentMethod: PaymentMethod.CreditCard,
  //       mpos: mpos);
  //   if (!mounted) return;
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transação MPOS - D150'),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "R\$ ",
                    style: TextStyle(fontSize: 60.0, color: Colors.blue[800]),
                  ),
                  Observer(
                    builder: (_){
                      return Text(
                        '${transactionMpos.currentValues}',
                        style: TextStyle(fontSize: 50.0, color: Colors.blue[800]),
                      );
                    },
                  ),
                ],
              )),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(15),
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
              builder: (_){
                return FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.blueAccent[400],
                  textColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  onPressed: transactionMpos.currentValues != "0.00" ?
                      () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>TransactionPaymentMethod(transactionMpos))
                    );
                  } : null,
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
