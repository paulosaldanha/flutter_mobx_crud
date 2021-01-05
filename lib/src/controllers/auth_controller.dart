import 'package:estruturabasica/src/models/auth_model.dart';
import 'package:estruturabasica/src/services/auth_service.dart';
import 'package:estruturabasica/src/util/authMap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

//nome_da_classe.g.dar usado pelo mobx para reatividade, criado dinamicamente (evita boilerplate)
part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {

  _AuthController();

  @observable
  bool loading = false;

  //referente ao formulario de inserção
  var auth = Auth();
  var service = AuthService();
  //validador de nome
  String validateEmail(){
    if (auth.email == null || !validateEmail_regex(auth.email)){
      return "Digite um email válido";
    }
    return null;
  }

  String validatePassword(){
    if(auth.password == null || auth.password.length < 3){
      return "Campo deve conter 3 caracteres no minimo";
    }
    return null;
  }

  bool validateEmail_regex(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  // dados computados, dados derivados de estado(reatividade) existente ou de outros dados computados
  @computed
  bool get isValid {
    return validateEmail() == null && validatePassword() == null;
  }
  @action
  bool setStateLoading (value) => loading = value;

  //ação do botao salvar/atualizar
  @action
  Future<Auth> add() async {
    auth = await service.authenticate(auth);
    return auth;
  }

  Future<bool> checkIfIsLogged() async {
    auth.setIsLogged(await service.autoLogIn().then((value) =>  loading = value));
    return auth.isLogged;
  }

  String getErrorLogin(){
    return auth.seterrorMsg(service.getError);
  }

  void logout() async {
    var valor = await AuthService.logout();
    print(valor);
    auth.isLogged = await AuthService.logout();
  }

  void autoLogIn(context) async {
    await checkIfIsLogged().then((value) {
      if (value == false) {
        Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
      }
    });
  }

  void getName() async {
   auth = await AuthMap.getAuthMap();
  }

}