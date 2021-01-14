import 'package:estruturabasica/src/models/auth_model.dart';
import 'package:estruturabasica/src/services/auth_service.dart';
import 'package:estruturabasica/src/util/authMap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {

  @observable
  bool loading = false;

  @observable
  bool isLogged;

  @observable
  Auth auth = Auth();

  AuthService service = AuthService();

  @action
  Future<bool> checkIfIsLogged() async {
    auth.setIsLogged(
        await service.autoLogIn().then((value) => loading = value));
    isLogged = auth.isLogged;
    return auth.isLogged;
  }

  void logout() async {
    auth.isLogged = await AuthService.logout();
  }

  void autoLogIn(context) async {
    await checkIfIsLogged().then((value) {
      if (value == false) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('login', (route) => false);
      }
    });
  }

   void getAuth() async {
    auth = await AuthMap.getAuthMap();
  }
}
