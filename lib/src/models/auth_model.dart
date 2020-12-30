import 'package:mobx/mobx.dart';
import 'dart:convert';
//define a parte do codigo que sera gerado
part 'auth_model.g.dart';
// cria a classe baseado no base e no que foi gerado. _$NomeDaClasse é a forma como é gerado por padrão
class Auth = _AuthBase with _$Auth;

abstract class _AuthBase with Store {

  int userId;
  int companyId;
  String nameCompany;
  String name = '';
  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  bool isLogged;
  @observable
  String errorMsg = '';

//getter and setter
  @action
  setEmail(String value) => email = value;

  @action
  setPassword(String value) => password = value;

  @action
  setIsLogged(bool value) => isLogged = value;

  @action
  seterrorMsg(String value) => errorMsg = value;

  //Constructors

  _AuthBase.construtorParametro (this.email,this.password,this.isLogged,this.errorMsg);

  _AuthBase ();

//List Functions
  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      'email': email,
      'senha': password
    };
    return map;
  }

  _AuthBase.fromMap(Map<String,dynamic> map){
    var payload = parseJwtPayLoad(map["accessToken"]);
    var mapeamentoDoJson = jsonDecode(payload["actort"]);
    email = mapeamentoDoJson['EmailUsuario'];
    name = mapeamentoDoJson['NomeUsuario'];
    userId = mapeamentoDoJson['UsuarioId'];
    companyId = mapeamentoDoJson['EstabelecimentoId'];
    nameCompany = mapeamentoDoJson['NomeEstabelecimento'];
  }

  Map<String, dynamic> toJson(){
    Map<String,dynamic > map = {
      'email': email.trim(),
      'senha': password.trim(),
    };
    return map;
  }

  Map<String, dynamic> parseJwtPayLoad(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }


}
