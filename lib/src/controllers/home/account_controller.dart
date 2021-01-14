import 'package:estruturabasica/src/screens/home/account.dart';
import 'package:mobx/mobx.dart';
import '';

part 'account_controller.g.dart';

class AccountController = _AccountController with _$AccountController;

abstract class _AccountController with Store {
  _AccountController();

  @observable
  String password;
  @observable
  String confirmPassword;
  @observable
  bool passwordVisible = true;
  @observable
  bool confirmPasswordVisible = true;

  bool validPassword = false;
  bool validConfirmPassword = false;

  @action
  setPassword(String value) => password = value;
  @action
  setConfirmPassword(String value) => confirmPassword = value;
  @action
  visibilityPassword() => passwordVisible = !passwordVisible;
  @action
  visibilityConfirmPassword() =>
      confirmPasswordVisible = !confirmPasswordVisible;

  //validador de Senha
  String validatePassword() {
    if (password == null) {
      validPassword = false;
      return null;
    }
    if (password.isEmpty) {
      validPassword = false;
      return "Senha obrigatória";
    }
    if (password.length < 8 || password.length > 32) {
      validPassword = false;
      return "Senha deve conter de 8 a 32 caracteres";
    }
    validPassword = true;
    return null;
  }

  //Confirmação de Senha
  String validateConfirmPassword() {
    if (confirmPassword == null) {
      validConfirmPassword = false;
      return null;
    }
    if (confirmPassword.length < 8 || confirmPassword.length > 32) {
      validPassword = false;
      return "Senha deve conter de 8 a 32 caracteres";
    }
    if (confirmPassword == password) {
      validConfirmPassword = true;
      return null;
    }
    validConfirmPassword = false;
    return "As senhas não conferem";
  }
}
