import 'package:mobx/mobx.dart';
part 'recoverpassword.g.dart';
// cria a classe baseado no base e no que foi gerado. _$NomeDaClasse é a forma como é gerado por padrão
class RecoverPassword = _RecoverPassword with _$RecoverPassword;

abstract class _RecoverPassword with Store {

}

class RecoverPasswordResponseModel{
  final String error;
  final String message;

  RecoverPasswordResponseModel({this.error, this.message});

  factory RecoverPasswordResponseModel.fromJson(Map<String, dynamic > json){
    if (json["accessToken"] != null){
      return RecoverPasswordResponseModel(error :json["error"] != null ? json["error"]:"");
    }else{
      return RecoverPasswordResponseModel(message: json["message"] != null ? json["message"]: "");
    }
  }
}

class RecoverPasswordModel{
  String email;

  Map<String, dynamic> toJson(){
    Map<String,dynamic > map = {
      'email': email.trim(),
    };
    return map;
  }
}