import 'package:mobx/mobx.dart';

part 'transaction_link.g.dart';

// cria a classe baseado no base e no que foi gerado. _$NomeDaClasse é a forma como é gerado por padrão
class TransactionLink = _TransactionLinkBase with _$TransactionLink;

//Store sinaliza que a classe esta apta a geração de codigo automatica do mobx
abstract class _TransactionLinkBase with Store {
  @observable
  String name;
  @observable
  double value;
  @observable
  String installments = "1";
  @observable
  DateTime dateExpiration;

  double valueTax;

//getter and setter
  @action
  setNome(String value) => name = value;
  @action
  setValue(String valueBillet) => value = double.parse(valueBillet);
  @action
  setInstallments(String parcela) => installments = parcela;
  @action
  setDateExpiration(DateTime value) => dateExpiration = value;
  @action
  setValueTax(String value) => valueTax = double.parse(value);
}
