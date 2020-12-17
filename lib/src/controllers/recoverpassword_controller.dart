import 'package:mobx/mobx.dart';
part 'recoverpassword_controller.g.dart';

class RecoverPasswordController = _RecoverPasswordController with _$RecoverPasswordController;

abstract class _RecoverPasswordController with Store {
  _RecoverPasswordController();

  @observable
  String email = '';
  setEmail(String value) => email = value;

}