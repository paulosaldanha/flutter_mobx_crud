import 'package:mobx/mobx.dart';

part 'people.g.dart';

class People = _PeopleBase with _$People;

abstract class _PeopleBase with Store {
  @observable
  String name;
  @observable
  String email;
  @observable
  String document;
  @observable
  String telephone;
  @observable
  String cep;
  @observable
  String rua;
  @observable
  String numero;
  @observable
  String complemento;
  @observable
  String password;

//getter and setter
  @action
  setNome(String value) => name = value;
  @action
  setEmail(String value) => email = value;
  @action
  setDocument(String value) => document = value;
  @action
  setTelephone(String value) => telephone = value;
  @action
  setCep(String value) => cep = value;
  @action
  setRua(String value) => rua = value;
  @action
  setNumero(String value) => numero = value;
  @action
  setComplemento(String value) => complemento = value;
  @action
  setPassword(String value) => password = value;
}
