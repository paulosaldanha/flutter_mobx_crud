import 'dart:async';
import 'package:cloud_crm/src/controllers/home/home_page_controller.dart';
import 'package:cloud_crm/src/controllers/login/auth_controller.dart';
import 'package:cloud_crm/src/services/auth_service.dart';
import 'package:cloud_crm/src/services/entries_service.dart';
import 'package:cloud_crm/src/utils/check_connection.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Splash extends StatelessWidget {
  final authController = GetIt.I.get<AuthController>();
  final homeController = GetIt.I.get<HomePageController>();
  final entriesService = EntriesService();

  void autoLogIn(context) {
    Timer(Duration(seconds: 2), () async {
      await authController.getLoginPayload();
      AuthService.checkIfUserIsLoggedIn().then((value) {
        if (value != "") {
          CheckConnection.checkConnection().then((value) async {
            if (value == true) {
              //online
              await homeController.loadData(reload: true);
              homeController.isFirstLoadData = false;
              if (authController.userData != null) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              }
            } else {
              //offline
              await homeController.loadData(reload: false);
              homeController.isFirstLoadData = false;
              if (authController.userData != null) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              }
            }
          });
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, 'loginform', (route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    autoLogIn(context);
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: Image.asset('assets/images/logo_novo.png'),
            ),
            SizedBox(
              height: 15,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor:
              AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
            ),
          ],
        ));
  }
}