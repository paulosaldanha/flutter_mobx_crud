import 'package:cloud_crm/src/api/api.dart';
import 'package:cloud_crm/src/external_services/password_external.dart';
import 'package:mobx/mobx.dart';

part 'my_account_controller.g.dart';

class MyAccountController = _MyAccountControllerBase with _$MyAccountController;

abstract class _MyAccountControllerBase with Store {
  _MyAccountControllerBase();

  PasswordExternal _passwordExternal = PasswordExternal(Api());

  @observable
  ObservableFuture<dynamic> request = ObservableFuture.value(null);

  @observable
  String oldPassword;
  @observable
  String newPassword;
  @observable
  String confirmPassword;
  @observable
  bool oldPasswordVisible = false;
  @observable
  bool newPasswordVisible = false;
  @observable
  bool confirmPasswordVisible = false;

  @action
  setOldPassword(String value) => oldPassword = value;
  @action
  setNewPassword(String value) => newPassword = value;
  @action
  setConfirmPassword(String value) => confirmPassword = value;

  @action
  toggleOldPasswordVisibility() => oldPasswordVisible = !oldPasswordVisible;
  @action
  toggleNewPasswordVisibility() => newPasswordVisible = !newPasswordVisible;
  @action
  toggleConfirmPasswordVisibility() =>
      confirmPasswordVisible = !confirmPasswordVisible;

  @action
  void cleanInputs() {
    newPassword = null;
    oldPassword = null;
    confirmPassword = null;
  }

  @computed
  bool get isLoading => request.status == FutureStatus.pending;

  @computed
  bool get validPassword => oldPassword != null && oldPassword.length >= 4;
  String get oldPasswordError {
    if (oldPassword == null || validPassword) {
      return null;
    } else {
      return "Preencha a senha atual.";
    }
  }

  @computed
  bool get validNewPassword => newPassword != null && newPassword.length >= 4;
  String get newPasswordError {
    if (newPassword != oldPassword && newPassword == oldPassword) {
      return "A nova senha deve ser diferente da senha atual.";
    } else if (newPassword == null || validNewPassword) {
      return null;
    } else {
      return "A nova senha deve conter pelo menos 4 caracteres.";
    }
  }

  @computed
  bool get validConfirmPassword =>
      confirmPassword != null && confirmPassword == newPassword;
  String get confirmPasswordError {
    if (confirmPassword == null || validConfirmPassword) {
      return null;
    } else {
      return "As senhas não conferem.";
    }
  }

  @computed
  bool get isValid {
    return oldPasswordError == null &&
        newPasswordError == null &&
        confirmPasswordError == null;
  }

  @action
  Future<dynamic> submit() {
    try {
      Map<String, String> payload = new Map();
      payload["password"] = newPassword;
      request = _passwordExternal.changePaswword(payload).asObservable();
      return request;
    } catch (e) {
      print(e);
    }
  }
}