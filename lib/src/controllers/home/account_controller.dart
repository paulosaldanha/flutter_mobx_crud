import 'package:ecommerceBankPay/src/api/api.dart';
import 'package:ecommerceBankPay/src/dto/password_dto.dart';
import 'package:ecommerceBankPay/src/services/register_service.dart';
import 'package:mobx/mobx.dart';

part 'account_controller.g.dart';

class AccountController = _AccountController with _$AccountController;

abstract class _AccountController with Store {
  _AccountController();

  RegisterService registerService = RegisterService(Api());

  @observable
  String oldPassword = "";
  @observable
  String password = "";
  @observable
  String confirmPassword = "";
  @observable
  bool passwordVisible = true;
  @observable
  bool confirmPasswordVisible = true;
  @observable
  bool loading = false;
  @observable
  bool isChangePassword = false;

  @computed
  bool get isLoadingRequest => request.status == FutureStatus.pending;

  @observable
  ObservableFuture<PasswordDto> request = ObservableFuture.value(null);

  @action
  setIsChangePassword() => isChangePassword = !isChangePassword;
  @action
  setOldPassword(String value) => oldPassword = value;
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

  @computed
  bool get validoldPassword =>
      oldPassword.length >= 8 && oldPassword.length <= 32;
  String get oldPasswordError {
    if (oldPassword == null || validoldPassword) {
      return null;
    } else if (oldPassword != null && oldPassword.isEmpty) {
      return "Senha atual obrigatória";
    } else {
      return "As senha precisão ser identicas";
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
    return validPassword &&
        validConfirmPassword &&
        validoldPassword &&
        !isLoadingRequest;
  }

  void changePassword() {
    request = registerService
        .changePassword(PasswordDto(oldPassword, password, confirmPassword))
        .asObservable();
  }
}
