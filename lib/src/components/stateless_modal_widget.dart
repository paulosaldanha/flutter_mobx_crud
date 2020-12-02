import 'dart:async';

import 'package:flutter/material.dart';

class StatlessModal extends StatelessWidget {
  StatlessModal({Key key}) : super(key: key);

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
                  const Text('Inserir o Cartão...'),
                  Expanded(
                    child: Container(
                      child: Image.asset('images/card.png'),
                    ),
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
