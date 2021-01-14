import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/components/mask.dart';
import 'package:estruturabasica/src/models/transaction_online.dart';
import 'package:estruturabasica/src/services/transaction_online_service.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

part 'transaction_online_controller.g.dart';

class TransactionOnlineController = _TransactionOnlineController
    with _$TransactionOnlineController;

abstract class _TransactionOnlineController with Store {
  _TransactionOnlineController();

  var transactionOnline = TransactionOnline();
  var service = TransactionOnlineService();

  bool validName = false;
  bool validEmail = false;
  bool validDocument = false;
  bool validDdd = false;
  bool validTelephone = false;

  @observable
  bool loading = false;

  MaskTextInputFormatter maskDocument = maskCpf();

  String validateName() {
    if (transactionOnline.name == null) {
      validName = false;
      return null;
    }
    if (transactionOnline.name.isEmpty || transactionOnline.name.length < 3) {
      validName = false;
      return "Nome obrigatório";
    }
    validName = true;
    return null;
  }

  String validateEmail() {
    if (transactionOnline.email == null) {
      validEmail = false;
      return null;
    }
    if (transactionOnline.email.isEmpty) {
      validEmail = false;
      return "Email obrigatório";
    }
    if (transactionOnline.email.length < 4 ||
        !transactionOnline.email.contains("@") ||
        !transactionOnline.email.contains(".")) {
      validEmail = false;
      return "Email inválido";
    }
    validEmail = true;
    return null;
  }

  String validateDocument() {
    if (transactionOnline.document == null) {
      validDocument = false;
      return null;
    }

    if (transactionOnline.document.length <= 14) {
      maskDocument.updateMask(mask: "###.###.###-###");
    } else {
      maskDocument.updateMask(mask: "##.###.###/####-##");
    }

    if (transactionOnline.document.isEmpty) {
      validDocument = false;
      return "Documento obrigatório";
    }
    if (CPF.isValid(transactionOnline.document) ||
        CNPJ.isValid(transactionOnline.document)) {
      validDocument = true;
      return null;
    } else {
      validDocument = false;
      return "Documento Inválido";
    }
  }

  String validateDdd() {
    if (transactionOnline.ddd == null) {
      validDdd = false;
      return null;
    }
    if (transactionOnline.ddd.isEmpty) {
      validDdd = false;
      return "DDD obrigatório";
    }
    validDdd = true;
    return null;
  }

  String validateTelephone() {
    if (transactionOnline.telephone == null) {
      validTelephone = false;
      return null;
    }
    if (transactionOnline.telephone.isEmpty ||
        transactionOnline.telephone.length < 8) {
      validTelephone = false;
      return "Telefone obrigatório";
    }
    validTelephone = true;
    return null;
  }

  String validateValue() {
    if (transactionOnline.value == null) {
      return null;
    }
    if (transactionOnline.value == null || transactionOnline.value < 10) {
      return "O valor minimo é R\$ 10,00";
    }
    return null;
  }

  String validateDateExpiration() {
    if (transactionOnline.cardDateExpiration == null) {
      return null;
    }
    if (transactionOnline.cardDateExpiration.length != 5) {
      return "Vencimento obrigatório";
    }
    return null;
  }

  String validateInstallments() {
    if (transactionOnline.installments == null) {
      return null;
    }
    if (transactionOnline.installments <= 0 ||
        transactionOnline.installments > 12) {
      return "Parcela obrigatório";
    }
    return null;
  }

  String validateCardName() {
    if (transactionOnline.cardName == null) {
      return null;
    }
    if (transactionOnline.cardName.isEmpty) {
      return "Nome do cartão é obrigatório";
    }
    return null;
  }

  String validateCardNumber() {
    if (transactionOnline.cardNumber == null) {
      return null;
    }
    if (transactionOnline.cardNumber.isEmpty) {
      return "Numero do cartão é obrigatório";
    }
    return null;
  }

  String validateCardCVV() {
    if (transactionOnline.cardCVV == null) {
      return null;
    }
    if (transactionOnline.cardCVV.isEmpty) {
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
        validateDateExpiration() == null &&
        !loading;
  }

  dynamic createTransctionTransactionOnline() async {
    return service.createTransactionOnline(transactionOnline);
  }
}
