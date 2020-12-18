import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DisplayValueWidget extends StatelessWidget {
  final controller;
  final errorDescription;
  final error;

  DisplayValueWidget(this.controller, this.errorDescription, this.error);


  @override
  Widget build(BuildContext context) {
    return Container(
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
                        '${controller.currentValues}',
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
                      return controller.visibilityModalBluetooth
                          ? Text(
                              errorDescription,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: (error)
                                    ? Colors.red[600]
                                    : Colors.lightGreen,
                              ),
                            )

                          : Text('');
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
