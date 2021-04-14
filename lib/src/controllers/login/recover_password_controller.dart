import 'package:cloud_crm/src/api/api.dart';
import 'package:cloud_crm/src/external_services/password_external.dart';
import 'package:mobx/mobx.dart';

part 'recover_password_controller.g.dart';

class RecoverPasswordController = _RecoverPasswordController
    with _$RecoverPasswordController;

abstract class _RecoverPasswordController with Store {
  PasswordExternal _passwordExternal = PasswordExternal(Api());

  @observable
  ObservableFuture<dynamic> request = ObservableFuture.value(null);

  @observable
  String username;

  @action
  void setUsername(String value) => username = value.trim();

  @computed
  bool get isLoading => request.status == FutureStatus.pending;

  @computed
  bool get validUsername =>
      username != null &&
          username.length > 4 &&
          username.contains("@") &&
          username.contains(".");
  String get usernameError {
    if (username == null || validUsername) {
      return null;
    } else if (username != null && username.isEmpty) {
      return "O campo email não pode estar vazio.";
    }
    return "E-mail Inválido.";
  }

  @computed
  bool get isValid => validUsername && !isLoading;

  @action
  dynamic submit() {
    try {
      Map<String, String> payload = new Map();
      payload["email"] = username;
      request = _passwordExternal.recoverPassword(payload).asObservable();
      return request;
    } catch (e) {
      print(e);
    }
  }
}