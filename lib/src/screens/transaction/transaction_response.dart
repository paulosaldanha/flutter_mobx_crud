import 'package:ecommerceBankPay/src/components/response/header_response_widget.dart';
import 'package:ecommerceBankPay/src/components/response/body_response_widget.dart';
import 'package:ecommerceBankPay/src/components/response/button_response_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TransactionResponse extends StatelessWidget {
  final response;
  final method;

  TransactionResponse(this.response, this.method);



  @override
  Widget build(BuildContext context) {
    // bool error = _validResponse();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            HeaderResponseWidget(response, false, method),
            SizedBox(height: 30),
            BodyResponseWidget(response, false, method),
            SizedBox(height: 60),
            ButtonResponseWidget(false)
          ],
        ));
  }
}
