import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/services/recoverpassword_service.dart';
part 'recoverpassword_controller.g.dart';

class RecoverPasswordController = _RecoverPasswordController
    with _$RecoverPasswordController;

abstract class _RecoverPasswordController with Store {
  _RecoverPasswordController();

  @observable
  String email;
  @observable
  bool loading = false;

  setEmail(String value) => email = value;

  @computed
  bool get isValid =>
      email != null &&
      email.length > 4 &&
      email.contains('@') &&
      email.contains(".");
  String get emailError {
    if (email == null || isValid) {
      return null;
    } else if (email != null && email.isEmpty) {
      return "Email obrigatório";
    } else {
      return "Email Inválido";
    }
  }

  dynamic solicitPassword() async {
    return await recoverPassword(email);
  }
}
