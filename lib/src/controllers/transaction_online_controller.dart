import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/transaction_online.dart';
import 'package:estruturabasica/src/services/transaction_online_service.dart';
import 'package:cpfcnpj/cpfcnpj.dart';

part 'transaction_online_controller.g.dart';

class TransactionOnlineController = _TransactionOnlineController
    with _$TransactionOnlineController;

abstract class _TransactionOnlineController with Store {
  _TransactionOnlineController();

  var transactiononline = TransactionOnline();
  var service = TransactionOnlineService();

  bool validName = false;
  bool validEmail = false;
  bool validDocument = false;
  bool validDdd = false;
  bool validTelephone = false;

  String validateName() {
    if (transactiononline.name == null) {
      validName = false;
      return null;
    }
    if (transactiononline.name.isEmpty || transactiononline.name.length < 3) {
      validName = false;
      return "Nome obrigatório";
    }
    validName = true;
    return null;
  }

  String validateEmail() {
    if (transactiononline.email == null) {
      validEmail = false;
      return null;
    }
    if (transactiononline.email.isEmpty) {
      validEmail = false;
      return "Email obrigatório";
    }
    if (transactiononline.email.length < 4 ||
        !transactiononline.email.contains("@") ||
        !transactiononline.email.contains(".")) {
      validEmail = false;
      return "Email inválido";
    }
    validEmail = true;
    return null;
  }

  String validateDocument() {
    if (transactiononline.document == null) {
      validDocument = false;
      return null;
    }
    if (transactiononline.document.isEmpty) {
      validDocument = false;
      return "Documento obrigatório";
    }
    if (CPF.isValid(transactiononline.document) ||
        CNPJ.isValid(transactiononline.document)) {
      validDocument = true;
      return null;
    } else {
      validDocument = false;
      return "Documento Inválido";
    }
  }

  String validateDdd() {
    if (transactiononline.ddd == null) {
      validDdd = false;
      return null;
    }
    if (transactiononline.ddd.isEmpty) {
      validDdd = false;
      return "DDD obrigatório";
    }
    validDdd = true;
    return null;
  }

  String validateTelephone() {
    if (transactiononline.telephone == null) {
      validTelephone = false;
      return null;
    }
    if (transactiononline.telephone.isEmpty ||
        transactiononline.telephone.length < 8) {
      validTelephone = false;
      return "Telefone obrigatório";
    }
    validTelephone = true;
    return null;
  }

  String validateValue() {
    if (transactiononline.value == null) {
      return null;
    }
    if (transactiononline.value == null || transactiononline.value < 10) {
      return "O valor minimo é R\$ 10,00";
    }
    return null;
  }

  String validateDateExpiration() {
    if (transactiononline.cardDateExpiration == null) {
      return null;
    }
    if (transactiononline.cardDateExpiration.length != 4) {
      return "Vencimento obrigatório";
    }
    return null;
  }

  String validateInstallments() {
    if (transactiononline.installments == null ||
        transactiononline.installments <= 0 ||
        transactiononline.installments > 12) {
      return "Parcela obrigatório";
    }
    return null;
  }

  String validateCardName() {
    if (transactiononline.cardName == null) {
      return null;
    }
    if (transactiononline.cardName.isEmpty) {
      return "Nome do cartão é obrigatório";
    }
    return null;
  }

  String validateCardNumber() {
    if (transactiononline.cardNumber == null) {
      return null;
    }
    if (transactiononline.cardNumber.isEmpty) {
      return "Numero do cartão é obrigatório";
    }
    return null;
  }

  String validateCardCVV() {
    if (transactiononline.cardCVV == null) {
      return null;
    }
    if (transactiononline.cardCVV.isEmpty) {
      return "Numero do cartão é obrigatório";
    }
    return null;
  }

  bool validate() {
    if (validName &&
        validEmail &&
        validDocument &&
        validDdd &&
        validTelephone) {
      return true;
    }
    return false;
  }

  @computed
  bool get isValid {
    return validateName() == null &&
        validateEmail() == null &&
        validateDocument() == null &&
        validateDdd() == null &&
        validateTelephone() == null &&
        validate() == true;
  }

  @computed
  bool get isValidPart3 {
    return validateCardName() == null &&
        validateCardNumber() == null &&
        validateCardCVV() == null &&
        validateDateExpiration() == null;
  }

  dynamic createTransctionTransactionOnline() async {
    return service.createTransactionOnline(transactiononline);
  }
}
