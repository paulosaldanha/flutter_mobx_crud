import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/transaction_link.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';

//nome_da_classe.g.dar usado pelo mobx para reatividade, criado dinamicamente (evita boilerplate)
part 'transaction_link_controller.g.dart';

class LinkController = _LinkController with _$LinkController;

abstract class _LinkController with Store {
  _LinkController();

  //referente ao formulario de inserção
  var link = TransactionLink();

  @observable
  String validDate = "";

  bool validName = false;

  @action
  setValidDate(String value) => validDate = value;

  //validador de nome
  String validateName() {
    if (link.name == null) {
      validName = false;
      return null;
    } else if (link.name.isEmpty ||
        link.name.length < 4 ||
        link.name.length > 60) {
      validName = false;
      return "O nome deve conter entre 4 e 60 caracteres";
    }
    validName = true;
    return null;
  }

  //validador de valor
  String validateValue() {
    if (link.value == null) {
      return null;
    } else if (link.value < 10) {
      return "O valor minimo é R\$ 10,00";
    }
    return null;
  }

  //validador de parcelas
  String validateInstallments() {
    if (int.parse(link.installments) < 1) {
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
      return false;
    } else {
      return true;
    }
  }

  void validateDateExpirationError() {
    if (!link.dateExpiration.isAfter(DateTime.now())) {
      setValidDate("Vencimento precisa de pelo menos 1 dia");
    } else {
      setValidDate("");
    }
  }

  bool validate() {
    if (validName) {
      return true;
    }
    return false;
  }

  // dados computados, dados derivados de link(reatividade) existente ou de outros dados computados
  @computed
  bool get isValid {
    return validateName() == null &&
        validateInstallments() == null &&
        validateDateExpiration() == true &&
        validate();
  }

  dynamic createTransctionLink() async {
    return createTransactionLink(link);
  }
}
