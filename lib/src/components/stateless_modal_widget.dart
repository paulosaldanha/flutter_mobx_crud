import 'dart:async';

import 'package:estruturabasica/src/controllers/transaction_mpos_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StatlessModal extends StatelessWidget {
  final TransactionMposController transactionMposController;

  StatlessModal(this.transactionMposController);

  @override
  Widget build(BuildContext context) {
    Timer.run(() {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Observer(builder: (_) {
                    return Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '${transactionMposController.titleStatus}',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Color.fromRGBO(55, 53, 116, 1),
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Container(
                        height: 250,
                        width: 350,
                        child: Observer(
                          builder: (_) {
                            return Image.asset(
                                transactionMposController.imgStatus);
                          },
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
    return Center();
  }
}
