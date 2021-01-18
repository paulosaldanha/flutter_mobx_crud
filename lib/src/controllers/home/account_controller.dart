import 'package:mobx/mobx.dart';

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
  @observable
  bool loading = false;

  @action
  setPassword(String value) => password = value;
  @action
  setConfirmPassword(String value) => confirmPassword = value;
  @action
  visibilityPassword() => passwordVisible = !passwordVisible;
  @action
  visibilityConfirmPassword() =>
      confirmPasswordVisible = !confirmPasswordVisible;

  // Validação de Senha
  @computed
  bool get validPassword => password.length >= 8 && password.length <= 32;
  String get passwordError {
    if (password == null || validPassword) {
      return null;
    } else if (password != null && password.isEmpty) {
      return "Senha obrigatória";
    } else {
      return "As passwords precisam ser identicas";
    }
  }

  // Validação de Confirmação de Senha
  @computed
  bool get validConfirmPassword =>
      confirmPassword.length != null && confirmPassword == password;
  String get confirmPasswordError {
    if (confirmPassword == null || validConfirmPassword) {
      return null;
    } else {
      return "As passwords precisam ser identicas";
    }
  }

  // Verifica se todas validções estão corretas
  @computed
  bool get isValid {
    return validPassword && validConfirmPassword && !loading;
  }
}
