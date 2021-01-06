import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/boleto.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';
import 'package:cpfcnpj/cpfcnpj.dart';

//nome_da_classe.g.dar usado pelo mobx para reatividade, criado dinamicamente (evita boilerplate)
part 'boleto_controller.g.dart';

class BoletoController = _BoletoController with _$BoletoController;

abstract class _BoletoController with Store {
  _BoletoController();

  //referente ao formulario de inserção
  var boleto = Boleto();

  bool validName = false;
  bool validDocument = false;
  bool validDdd = false;
  bool validTelephone = false;

  @observable
  String validDate = "";
  @action
  setValidDate(value) => validDate = value;

  //validador de nome
  String validateName() {
    if (boleto.name == null) {
      validName = false;
      return null;
    } else if (boleto.name.isEmpty ||
        boleto.name.length < 4 ||
        boleto.name.length > 60) {
      validName = false;
      return "O nome deve conter entre 4 e 60 caracteres";
    }
    validName = true;
    return null;
  }

  //validador de document
  String validateDocument() {
    if (boleto.document == null) {
      validDocument = false;
      return null;
    } else if (boleto.document.isEmpty) {
      validDocument = false;
      return "Documento obrigatório";
    } else if (CPF.isValid(boleto.document) || CNPJ.isValid(boleto.document)) {
      validDocument = true;
      return null;
    } else {
      validDocument = false;
      return "Documento Inválido";
    }
  }

  //validador de DDD
  String validateDdd() {
    if (boleto.ddd == null) {
      validDdd = false;
      return null;
    } else if (boleto.ddd.isEmpty) {
      validDdd = false;
      return "DDD obrigatório";
    }
    validDdd = true;
    return null;
  }

  //validador de Telephone
  String validateTelephone() {
    if (boleto.telephone == null) {
      validTelephone = false;
      return null;
    } else if (boleto.telephone.isEmpty) {
      validTelephone = false;
      return "Telefone obrigatório";
    } else if (!(boleto.telephone.length == 9)) {
      validTelephone = false;
      return "Telefone deve contar 9 digitos";
    }
    validTelephone = true;
    return null;
  }

  //validador de Value
  String validateValue() {
    if (boleto.value == null) {
      return null;
    } else if (boleto.value < 10) {
      return "O valor minimo é R\$ 10,00";
    }
    return null;
  }

  //validador de Vencimento
  bool validateDateExpiration() {
    if (!boleto.dateExpiration.isAfter(DateTime.now())) {
      return false;
    } else {
      return true;
    }
  }

  void validateDateExpirationError() {
    if (!boleto.dateExpiration.isAfter(DateTime.now())) {
      setValidDate("Vencimento precisa de pelo menos 1 dia");
    } else {
      setValidDate("");
    }
  }

  bool validate() {
    if (validName && validDocument && validDdd && validTelephone) {
      return true;
    }
    return false;
  }

  // dados computados, dados derivados de boleto(reatividade) existente ou de outros dados computados
  @computed
  bool get isValid {
    return validateName() == null &&
        validateDocument() == null &&
        validateDdd() == null &&
        validateTelephone() == null &&
        validateDateExpiration() == true &&
        validate() == true;
  }

  dynamic createTransctionBoleto() async {
    return createTransactionBoleto(boleto);
  }
}
