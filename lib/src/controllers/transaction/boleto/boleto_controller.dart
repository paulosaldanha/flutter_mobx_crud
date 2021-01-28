import 'package:estruturabasica/src/models/user_thinkdata.dart';
import 'package:estruturabasica/src/services/thinkdata_service.dart';
import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/boleto.dart';
import 'package:estruturabasica/src/components/mask.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

part 'boleto_controller.g.dart';

class BoletoController = _BoletoController with _$BoletoController;

abstract class _BoletoController with Store {
  _BoletoController();

  Boleto boleto = Boleto();

  MaskTextInputFormatter maskDocument = maskCpf();

  @observable
  String validDate = "";
  @observable
  UserThinkdata userThink;
  @observable
  bool loading = false;

  @action
  setValidDate(value) => validDate = value;

  // Validação de Documento
  @computed
  bool get validDocument =>
      boleto.document != null &&
      (CPF.isValid(boleto.document) || CNPJ.isValid(boleto.document));

  String get documentError {
    if (boleto.document != null && boleto.document.length > 14) {
      maskDocument.updateMask(mask: "##.###.###/####-##");
    } else {
      maskDocument.updateMask(mask: "###.###.###-###");
    }

    if (boleto.document == null || validDocument) {
      return null;
    } else if (boleto.document != null && boleto.document.isEmpty) {
      return "Documento obrigatório";
    } else {
      return "Documento Inválido";
    }
  }

  // Validação de Nome
  @computed
  bool get validName =>
      boleto.name != null &&
      boleto.name.length >= 4 &&
      boleto.name.length <= 60;

  String get nameError {
    if (boleto.name == null || validName) {
      return null;
    } else if (boleto.name != null && boleto.name.isEmpty) {
      return "Nome obrigatório";
    } else {
      return "Nome deve conter entre 4 e 60 caracteres";
    }
  }

  // Validação de DDD
  @computed
  bool get validDdd =>
      boleto.ddd != null && boleto.ddd.length > 0 && boleto.ddd.length < 3;

  String get dddError {
    if (boleto.ddd == null || validDdd) {
      return null;
    } else if (boleto.ddd != null && boleto.ddd.isEmpty) {
      return "DDD obrigatório";
    }
    return "DDD Inválido";
  }

  // Validação de Telephone
  @computed
  bool get validTelephone =>
      boleto.telephone != null && boleto.telephone.length == 11;

  String get telephoneError {
    if (boleto.telephone == null || validTelephone) {
      return null;
    } else if (boleto.telephone != null && boleto.telephone.isEmpty) {
      return "Telefone obrigatório";
    } else {
      return "Telefone deve contar 9 digitos";
    }
  }

  //validação de Vencimento
  @computed
  bool get validateDateExpiration =>
      boleto.dateExpiration.isAfter(DateTime.now());

  void dateExpirationError() {
    if (validateDateExpiration) {
      setValidDate("Vencimento precisa de pelo menos 1 dia");
    } else {
      setValidDate("");
    }
  }

  @computed
  bool get isValid {
    return validName &&
        validDocument &&
        validDdd &&
        validTelephone &&
        validateDateExpiration;
  }

  dynamic createTransctionBoleto() async {
    return createTransactionBoleto(boleto);
  }

  Future<void> getUserThink() async {
    loading = true;
    if (boleto.document != null &&
        (CPF.isValid(boleto.document) || CNPJ.isValid(boleto.document))) {
      getUserThinkData(boleto.document).then((value) {
        userThink = value;
        boleto.setDdd(userThink.ddd);
        boleto.setNome(userThink.name);
        boleto.setTelephone(userThink.phone);
        loading = false;
      });
    }
  }
}
