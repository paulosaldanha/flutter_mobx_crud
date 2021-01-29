import 'package:estruturabasica/src/api/api.dart';
import 'package:estruturabasica/src/models/user_thinkdata.dart';
import 'package:estruturabasica/src/services/thinkdata_service.dart';
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

  ThinkDataService thinkDataService = ThinkDataService(Api());
  var transactionOnline = TransactionOnline();
  var service = TransactionOnlineService(Api());

  @observable
  UserThinkdata userThink;

  @observable
  bool loading = false;

  MaskTextInputFormatter maskDocument = maskCpf();

  // Validação de Nome
  @computed
  bool get validName =>
      transactionOnline.name != null && transactionOnline.name.length >= 3;

  String get nameError {
    if (transactionOnline.name == null || validName) {
      return null;
    }
    if (transactionOnline.name != null && transactionOnline.name.isEmpty) {
      return "Nome obrigatório";
    } else {
      return "Nome deve ter mais de 3 caracteres";
    }
  }

  // Validação de Email
  bool get validEmail =>
      transactionOnline.email != null &&
      transactionOnline.email.length > 3 &&
      transactionOnline.email.contains("@") &&
      transactionOnline.email.contains(".");

  String get emailError {
    if (transactionOnline.email == null || validEmail) {
      return null;
    } else if (transactionOnline.email != null &&
        transactionOnline.email.isEmpty) {
      return "Email obrigatório";
    } else {
      return "Email inválido";
    }
  }

  // Validação de Documento
  bool get validDocument =>
      transactionOnline.document != null &&
      (CPF.isValid(transactionOnline.document) ||
          CNPJ.isValid(transactionOnline.document));

  String get documentError {
    if (transactionOnline.document == null ||
        transactionOnline.document.length <= 14) {
      maskDocument.updateMask(mask: "###.###.###-###");
    } else {
      maskDocument.updateMask(mask: "##.###.###/####-##");
    }

    if (transactionOnline.document == null || validDocument) {
      return null;
    } else if (transactionOnline.document != null &&
        transactionOnline.document.isEmpty) {
      return "Documento obrigatório";
    } else {
      return "Documento Inválido";
    }
  }

  // Validação de DDD
  bool get validDdd =>
      transactionOnline.ddd != null &&
      transactionOnline.ddd.length > 0 &&
      transactionOnline.ddd.length < 3;

  String get dddError {
    if (transactionOnline.ddd == null || validDdd) {
      return null;
    } else if (transactionOnline.document != null &&
        transactionOnline.ddd.isEmpty) {
      return "DDD obrigatório";
    }
    return "DDD inválido";
  }

  // Validação de Telefone
  bool get validTelephone =>
      transactionOnline.telephone != null &&
      transactionOnline.telephone.length >= 8;

  String get telephoneError {
    if (transactionOnline.telephone == null || validTelephone) {
      return null;
    }
    if (transactionOnline.telephone != null &&
        transactionOnline.telephone.isEmpty) {
      return "Telefone obrigatório";
    } else {
      return "Telefone Inválido";
    }
  }

  // Validação de Nome do Cartão
  @computed
  bool get validCardName =>
      transactionOnline.cardName != null &&
      transactionOnline.cardName.isNotEmpty;

  String get cardNameError {
    if (transactionOnline.cardName == null || validCardName) {
      return null;
    } else {
      return "Nome do cartão é obrigatório";
    }
  }

  // Validação de Número do cartão
  @computed
  bool get validCardNumber =>
      transactionOnline.cardNumber != null &&
      transactionOnline.cardNumber.length > 16 &&
      transactionOnline.cardNumber.length < 20;

  String get cardNumberError {
    if (transactionOnline.cardNumber == null || validCardNumber) {
      return null;
    } else if (transactionOnline.cardNumber != null &&
        transactionOnline.cardNumber.isEmpty) {
      return "Número do cartão é obrigatório";
    } else {
      return "Número do cartão Inválido";
    }
  }

  // Validação de Expiração do cartão
  @computed
  bool get validCardDateExpiration =>
      transactionOnline.cardDateExpiration != null &&
      transactionOnline.cardDateExpiration.length == 5;

  String get dateExpirationError {
    if (transactionOnline.cardDateExpiration == null ||
        validCardDateExpiration) {
      return null;
    } else if (transactionOnline.cardDateExpiration != null ||
        transactionOnline.cardDateExpiration.isEmpty) {
      return "Vencimento obrigatório";
    } else {
      return "Vencimento Inválido";
    }
  }

  // Validação de CVV de cartão
  @computed
  bool get validCardCVV =>
      transactionOnline.cardCVV != null &&
      transactionOnline.cardCVV.length > 2 &&
      transactionOnline.cardCVV.length < 5;

  String get cardCVVError {
    if (transactionOnline.cardCVV == null || validCardCVV) {
      return null;
    } else if (transactionOnline.cardCVV != null &&
        transactionOnline.cardCVV.isEmpty) {
      return "CVV é obrigatório";
    } else {
      return "CVV Inválido";
    }
  }

  @computed
  bool get isValid {
    return validName &&
        validEmail &&
        validDocument &&
        validDdd &&
        validTelephone;
  }

  @computed
  bool get isValidPart3 {
    return validCardName &&
        validCardNumber &&
        validCardCVV &&
        validCardDateExpiration &&
        !loading;
  }

  dynamic createTransctionTransactionOnline() async {
    return service.createTransactionOnline(transactionOnline);
  }

  Future<void> getUserThink() async {
    loading = true;
    if (transactionOnline.document != null &&
        (CPF.isValid(transactionOnline.document) ||
            CNPJ.isValid(transactionOnline.document))) {
      thinkDataService.getUserThinkData(transactionOnline.document).then((value) {
        userThink = value;
        transactionOnline.setDdd(userThink.ddd);
        transactionOnline.setNome(userThink.name);
        transactionOnline.setTelephone(userThink.phone);
        loading = false;
      });
    }
  }
}
