import 'dart:async';

import 'package:estruturabasica/src/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  final authController = AuthController();

  void autoLogIn(context) async {
    Timer(Duration(seconds: 2), () async {
      await authController.checkIfIsLogged().then((value) {
        if (value == true) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }else{
          Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    autoLogIn(context);
    return Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: Image.asset('images/splash.png'),
            ),
            SizedBox(
              height: 15,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.black,
            ),
          ],
        ));
  }
}
