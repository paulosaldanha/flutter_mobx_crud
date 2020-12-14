import 'package:estruturabasica/src/models/transaction_Mpos.dart';
import 'package:flutter/material.dart';

class BuildKeyItemWidget extends StatelessWidget {

  final String val;
  final transactionMpos;

  BuildKeyItemWidget(this.val, this.transactionMpos);

  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Color.fromRGBO(0,74,173, 1),
      onPressed: () {
        transactionMpos.setCurrentValues(val);
      },
      child: Text(
        val,
        style: TextStyle(
            fontSize: 30.0,
            color: Colors.white
        ),
      ),
    );
  }
}
