import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/transaction_online.dart';
import 'package:estruturabasica/src/services/transaction_online_service.dart';
import 'package:cpfcnpj/cpfcnpj.dart';

part 'transaction_online_controller.g.dart';

class TransactionOnlineController = _TransactionOnlineController with _$TransactionOnlineController;

abstract class _TransactionOnlineController with Store {
  _TransactionOnlineController();

  var transactiononline = TransactionOnline();
  var service = TransactionOnlineService();


  String validateName() {
    if (transactiononline.name == null || transactiononline.name.isEmpty || transactiononline.name.length < 3) {
      return "Nome obrigatório";
    }
    return null;
  }

  String validateEmail() {
    if (transactiononline.email == null || transactiononline.email.isEmpty) {
      return "Email obrigatório";
    }
    if (transactiononline.email.length < 4 ||
        !transactiononline.email.contains("@") ||
        !transactiononline.email.contains(".")) {
      return "Email inválido";
    }
    return null;
  }

  String validateDocument() {
    if (transactiononline.document == null || transactiononline.document.isEmpty) {
      return "Documento obrigatório";
    }
    if (CPF.isValid(transactiononline.document) || CNPJ.isValid(transactiononline.document)) {
      return null;
    } else {
      return "Documento Inválido";
    }
  }

  String validateDdd() {
    if (transactiononline.ddd == null || transactiononline.ddd.isEmpty) {
      return "DDD obrigatório";
    }
    return null;
  }

  String validateTelephone() {
    if (transactiononline.telephone == null ||
        transactiononline.telephone.isEmpty ||
        transactiononline.telephone.length < 8) {
      return "Telefone obrigatório";
    }
    return null;
  }

  String validateValue() {
    if (transactiononline.value == null || transactiononline.value < 10) {
      return "O valor minimo é R\$ 10,00";
    }
    return null;
  }

  String validateDateExpiration() {
    if (transactiononline.cardDateExpiration == null || transactiononline.cardDateExpiration.length != 4  ) {
      return "Vencimento obrigatório";
    }
    return null;
  }

  String validateInstallments() {
    if (transactiononline.installments == null || transactiononline.installments <= 0 ||  transactiononline.installments > 12 ) {
      return "Parcela obrigatório";
    }
    return null;
  }

  String validateCardName() {
    if (transactiononline.cardName == null || transactiononline.cardName.isEmpty) {
      return "Nome do cartão é obrigatório";
    }
    return null;
  }

  String validateCardNumber() {
    if (transactiononline.cardNumber == null || transactiononline.cardNumber.isEmpty) {
      return "Numero do cartão é obrigatório";
    }
    return null;
  }

  String validateCardCVV() {
    if (transactiononline.cardCVV == null || transactiononline.cardCVV.isEmpty) {
      return "Numero do cartão é obrigatório";
    }
    return null;
  }


  @computed
  bool get isValid {
    return validateName() == null &&
        validateEmail() == null &&
        validateDocument() == null &&
        validateDdd() == null &&
        validateTelephone() == null;
  }

  @computed
  bool get isValidPart3 {
    return validateCardName() == null &&
    validateCardNumber() == null &&
    validateCardCVV()  == null &&
    validateDateExpiration() == null;
  }

  dynamic createTransctionTransactionOnline() async {
    return service.createTransactionOnline(transactiononline);
  }
}
