import 'package:cloud_crm/src/api/token/token_storage.dart';
import 'package:cloud_crm/src/dto/login_payload_dto.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  var tokenStorage = new TokenStorage();

  @observable
  var userData = new LoginPayloadDto();

  void getLoginPayload() async {
    try {
      userData = await tokenStorage.getPayLoad();
    } catch (e) {
      print(e);
    }
  }
}