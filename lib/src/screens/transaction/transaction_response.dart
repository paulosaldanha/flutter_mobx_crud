import 'package:estruturabasica/src/components/response/header_response_widget.dart';
import 'package:estruturabasica/src/components/response/body_response_widget.dart';
import 'package:estruturabasica/src/components/response/button_response_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TransactionResponse extends StatelessWidget {
  final response;
  final method;

  TransactionResponse(this.response, this.method);

  bool _validResponse() {
    print(response.containsKey("errors"));
    if (response.containsKey("errors") || response["status"] == 500) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    bool error = _validResponse();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            HeaderResponseWidget(response, error, method),
            SizedBox(height: 30),
            BodyResponseWidget(response, error, method),
            SizedBox(height: 60),
            ButtonResponseWidget(error)
          ],
        ));
  }
}
