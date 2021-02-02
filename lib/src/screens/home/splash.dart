import 'dart:async';

import 'package:ecommerceBankPay/src/controllers/auth/auth_controller.dart';
import 'package:ecommerceBankPay/src/util/check_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class Splash extends StatelessWidget {
  final authController = AuthController();

  void autoLogIn(context) async {
    Timer(Duration(seconds: 2), () async {
      await authController.getVersion();
      CheckConnection.checkConnection().then((value) async {
        if(value == true){
          await authController.checkIfIsLogged().then((value) {
            if (value == true) {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
            }
          });
        }else{
          Navigator.pushNamedAndRemoveUntil(context, 'wifioff', (route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    autoLogIn(context);
    return Material(
        type: MaterialType.transparency,
        child: Container(
          color: Color.fromRGBO(0, 74, 173, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                child: Image.asset('images/transp_pay.png'),
              ),
              SizedBox(
                height: 15,
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.black,
              ),
              SizedBox(height: 60),
              Observer(builder: (_)=>authController.version != null ?Text("versão: "+authController.version,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),):Text("")),
            ],
          )),
    );
  }
}
