import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';

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
  @observable
  double valueTax;

//getter and setter
  @action
  setNome(String value) => name = value;
  @action
  setValue(String valueBillet) {
    value = double.parse(valueBillet);
    setValueTax(value.toString());
  }

  @action
  setValueTax(String value) async {
    dynamic taxa = await getTax(value, 3);
    valueTax = taxa[int.parse(installments) - 1];
  }

  @action
  setInstallments(String parcela) {
    installments = parcela;
    setValueTax(value.toString());
  }

  @action
  setDateExpiration(DateTime value) => dateExpiration = value;
}
