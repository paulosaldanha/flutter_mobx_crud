import 'package:mobx/mobx.dart';
//define a parte do codigo que sera gerado
part 'auth_model.g.dart';
// cria a classe baseado no base e no que foi gerado. _$NomeDaClasse é a forma como é gerado por padrão
class Auth = _AuthBase with _$Auth;

abstract class _AuthBase with Store {

  @observable
  String email = '';
  @observable
  String senha = '';
  @observable
  bool isLogged;
  @observable
  String errorMsg = '';

//getter and setter
  @action
  setEmail(String value) => email = value;

  @action
  setSenha(String value) => senha = value;

  @action
  setIsLogged(bool value) => isLogged = value;

  @action
  seterrorMsg(String value) => errorMsg = value;

  //Constructors

  _AuthBase.construtorParametro (this.email,this.senha,this.isLogged,this.errorMsg);

  _AuthBase ();

//List Functions
  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      'email': email,
      'senha': senha
    };
    return map;
  }

  _AuthBase.fromMap(Map<String,dynamic> map){
    email = map['email'];
    senha = map['senha'];
  }

  Map<String, dynamic> toJson(){
    Map<String,dynamic > map = {
      'email': email.trim(),
      'senha': senha.trim(),
    };
    return map;
  }

}
