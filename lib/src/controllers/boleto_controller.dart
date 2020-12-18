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

  @observable
  String validDate = "";
  @action
  setValidDate(value) => validDate = value;

  //validador de nome
  String validateName() {
    if (boleto.name == null) {
      return null;
    } else if (boleto.name.isEmpty || boleto.name.length < 3) {
      return "Nome obrigatório";
    }
    return null;
  }


  //validador de document
  String validateDocument() {
    if (boleto.document == null) {
      return null;
    } else if (boleto.document.isEmpty) {
      return "Documento obrigatório";
    } else if (CPF.isValid(boleto.document) || CNPJ.isValid(boleto.document)) {
      return null;
    } else {
      return "Documento Inválido";
    }
  }

  //validador de DDD
  String validateDdd() {
    if (boleto.ddd == null) {
      return null;
    } else if (boleto.ddd.isEmpty) {

      return "DDD obrigatório";
    }
    return null;
  }

  //validador de Telephone
  String validateTelephone() {
    if (boleto.telephone == null) {
      return null;
    } else if (boleto.telephone.isEmpty || boleto.telephone.length < 8) {

      return "Telefone obrigatório";
    }
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
      setValidDate("Data de vencimento inválida");
    } else {
      setValidDate("");
    }

  }

  // dados computados, dados derivados de boleto(reatividade) existente ou de outros dados computados
  @computed
  bool get isValid {
    return validateName() == null &&
        validateDocument() == null &&
        validateDdd() == null &&
        validateTelephone() == null &&
        validateDateExpiration() == true;
  }
  dynamic createTransctionBoleto() async {
    return createTransactionBoleto(boleto);
  }
}
