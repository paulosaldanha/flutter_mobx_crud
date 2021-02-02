import 'package:estruturabasica/src/api/api.dart';
import 'package:estruturabasica/src/models/auth_model.dart';
import 'package:estruturabasica/src/services/auth_service.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  var service = AuthService(Api());

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  Auth auth = Auth();

  @observable
  bool passwordVisible = false;

  @observable
  ObservableFuture<Auth> request = ObservableFuture.value(null);

  @computed
  bool get isLoading => request.status == FutureStatus.pending;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @computed
  bool get isEmailValid => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get loginPressed => isEmailValid && isPasswordValid && !isLoading;

  @action
  Future<void> login() async {
    auth.setEmail(email);
    auth.setPassword(password);
    auth.setIsLogged(null);
    request = service
        .authenticate(auth)
        .asObservable();
  }
}
