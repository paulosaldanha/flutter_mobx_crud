import 'package:mobx/mobx.dart';

part 'boleto.g.dart';

// cria a classe baseado no base e no que foi gerado. _$NomeDaClasse é a forma como é gerado por padrão
class Boleto = _BoletoBase with _$Boleto;

//Store sinaliza que a classe esta apta a geração de codigo automatica do mobx
abstract class _BoletoBase with Store {
  @observable
  String name;
  @observable
  String document;
  @observable
  String ddd;
  @observable
  String telephone;
  @observable
  double value;
  @observable
  DateTime dateExpiration;

  String message;
  String valueTax;

//getter and setter
  @action
  setNome(String value) => name = value;
  @action
  setDocument(String value) => document = value;
  @action
  setDdd(String value) => ddd = value;
  @action
  setTelephone(String value) => telephone = value;
  @action
  setValue(String valueBillet) => value = double.parse(valueBillet);
  @action
  setDateExpiration(DateTime value) => dateExpiration = value;
  @action
  setMessage(String value) => message = value;
  @action
  setValueTax(String value) => valueTax = value;
}
