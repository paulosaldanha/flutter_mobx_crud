import 'dart:async';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:estruturabasica/src/controllers/transaction_mpos_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BluetoothModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer.run(() {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Carousel(
                        images: [
                          AssetImage('images/modal1.png'),
                          AssetImage('images/modal2.png'),
                          AssetImage('images/modal3.png'),
                          AssetImage('images/modal4.png'),
                        ],
                        boxFit: BoxFit.fill,
                        dotSize: 2.0,
                        dotSpacing: 15.0,
                        dotBgColor: Colors.transparent,
                        dotColor: Theme.of(context).primaryColor,
                        autoplay: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
    return Text('');
  }
}
