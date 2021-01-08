import 'package:flutter/material.dart';

class BuildKeyItemWidget extends StatelessWidget {
  final String val;
  final transactionMpos;

  BuildKeyItemWidget(this.val, this.transactionMpos);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(color: Colors.white),
      ),
      color: Colors.white,
      onPressed: () {
        transactionMpos.setCurrentValues(val);
      },
      child: Text(
        val,
        style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(0, 74, 173, 1)),
      ),
    );
  }
}
