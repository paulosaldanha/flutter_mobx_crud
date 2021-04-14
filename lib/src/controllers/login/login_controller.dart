import 'package:cloud_crm/src/api/api.dart';
import 'package:cloud_crm/src/dto/login_dto.dart';
import 'package:cloud_crm/src/dto/login_payload_dto.dart';
import 'package:cloud_crm/src/external_services/login_external.dart';
import 'package:cloud_crm/src/services/auth_service.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {

  AuthService _authService = AuthService(LoginExternal(Api()));

  @observable
  String username = "";

  @action
  void setUsername(String value) => username = value.trim();

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value.trim();

  @computed
  bool get isLoading => request.status == FutureStatus.pending;

  @observable
  bool passwordVisible = false;

  @observable
  ObservableFuture<LoginPayloadDto> request = ObservableFuture.value(null);

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @computed
  bool get isEmailValid => RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(username);

  @computed
  bool get isPasswordValid => password.length >= 4;

  @computed
  bool get loginPressed => isEmailValid && isPasswordValid &&  !isLoading;

  @action
  void submit() {
    try {
      request = _authService
          .login(LoginDto(username, password))
          .asObservable();
    } catch (e) {
      print(e);
    }
  }

}