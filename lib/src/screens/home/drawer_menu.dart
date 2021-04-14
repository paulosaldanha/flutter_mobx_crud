import 'dart:io';

import 'package:cloud_crm/src/api/api.dart';
import 'package:cloud_crm/src/controllers/login/auth_controller.dart';
import 'package:cloud_crm/src/external_services/login_external.dart';
import 'package:cloud_crm/src/routes/routing_constants.dart';
import 'package:cloud_crm/src/services/auth_service.dart';
import 'package:cloud_crm/src/utils/check_connection.dart';
import 'package:cloud_crm/src/utils/get_color_or_default.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DrawerMenu extends StatelessWidget {
  AuthService _authService = AuthService(LoginExternal(Api()));
  final authController = GetIt.I.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 50,
                  child: Image.network(authController.userData.company.logo),
                ),
                SizedBox(height: 10),
                Text(
                  authController.userData.user.nome,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: getCompanyColorOrDefault(),
            ),
          ),
          ListTile(
            title: Text('Minha Conta'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(MyAccountRoute,
                  arguments: authController.userData);
            },
          ),
          ListTile(
            title: Text('Sair'),
            onTap: () {
              CheckConnection.checkConnection().then((value) {
                if (value == true) {
                  AuthService.logout();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(LoginRoute, (route) => false);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}