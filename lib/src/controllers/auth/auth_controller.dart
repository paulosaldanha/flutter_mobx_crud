import 'dart:io';

import 'package:ecommerceBankPay/src/api/api.dart';
import 'package:ecommerceBankPay/src/models/auth_model.dart';
import 'package:ecommerceBankPay/src/services/auth_service.dart';
import 'package:ecommerceBankPay/src/util/authMap.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info/package_info.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  @observable
  bool loading = false;

  @observable
  bool isLogged;

  @observable
  String version;

  @observable
  Auth auth = Auth();

  @observable
  File file;

  @action
  void setfile(File value) => file = value;

  AuthService service = AuthService(Api());

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

  void getAuth() async {
    auth = await AuthMap.getAuthMap();
  }

  void getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
  }
}
