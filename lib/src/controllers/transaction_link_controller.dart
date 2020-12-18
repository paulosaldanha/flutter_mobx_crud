import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/transaction_link.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';

//nome_da_classe.g.dar usado pelo mobx para reatividade, criado dinamicamente (evita boilerplate)
part 'transaction_link_controller.g.dart';

class TransactionLinkController = _TransactionLinkController
    with _$TransactionLinkController;

abstract class _TransactionLinkController with Store {
  _TransactionLinkController();

  //referente ao formulario de inserção
  var link = TransactionLink();

  @observable
  String validDate = "";
  @action
  setValidDate(String value) => validDate = value;

  //validador de nome
  String validateName() {
    if (link.name == null || link.name.isEmpty || link.name.length < 3) {
      return "Nome obrigatório";
    }
    return null;
  }

  //validador de valor
  String validateValue() {
    if (link.value == null || link.value < 10) {
      return "O valor minimo é R\$ 10,00";
    }
    return null;
  }

  //validador de parcelas
  String validateInstallments() {
    if (link.installments == null || int.parse(link.installments) < 1) {
      return "Número de parcelas obrigatório";
    }
    if (int.parse(link.installments) > 12) {
      return "O número de parcelas maxima é 12";
    }
    return null;
  }

  //validador de Vencimento
  bool validateDateExpiration() {
    if (!link.dateExpiration.isAfter(DateTime.now())) {
      //setValidDate("Data de vencimento inválida");
      return false;
    } else {
      //setValidDate("");
      return true;
    }
  }

  // dados computados, dados derivados de link(reatividade) existente ou de outros dados computados
  @computed
  bool get isValid {
    return validateName() == null &&
        validateValue() == null &&
        validateInstallments() == null &&
        validateDateExpiration() == true;
  }

  dynamic createTransctionLink() async {
    return createTransactionLink(link);
  }
}
