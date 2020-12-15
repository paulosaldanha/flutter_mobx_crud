import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/boleto.dart';
import 'package:estruturabasica/src/services/boleto_service.dart';
import 'package:cpfcnpj/cpfcnpj.dart';

//nome_da_classe.g.dar usado pelo mobx para reatividade, criado dinamicamente (evita boilerplate)
part 'boleto_controller.g.dart';

class BoletoController = _BoletoController with _$BoletoController;

abstract class _BoletoController with Store {
  _BoletoController();

  //referente ao formulario de inserção
  var boleto = Boleto();
  var service = BoletoService();

  @observable
  String pattern = '';
  //set do filter, ação do campo observavel, toda vez que modificado, muda seu estado, chama a action
  @action
  setPattern(String value) => pattern = value;

  //validador de nome
  String validateName() {
    if (boleto.name == null || boleto.name.isEmpty || boleto.name.length < 3) {
      return "Nome obrigatório";
    }
    return null;
  }

  //validador de email
  String validateEmail() {
    if (boleto.email == null || boleto.email.isEmpty) {
      return "Email obrigatório";
    }
    if (boleto.email.length < 4 ||
        !boleto.email.contains("@") ||
        !boleto.email.contains(".")) {
      return "Email inválido";
    }
    return null;
  }

  //validador de document
  String validateDocument() {
    if (boleto.document == null || boleto.document.isEmpty) {
      return "Documento obrigatório";
    }
    if (CPF.isValid(boleto.document) || CNPJ.isValid(boleto.document)) {
      return null;
    } else {
      return "Documento Inválido";
    }
  }

  //validador de DDD
  String validateDdd() {
    if (boleto.ddd == null || boleto.ddd.isEmpty) {
      return "DDD obrigatório";
    }
    return null;
  }

  //validador de Telephone
  String validateTelephone() {
    if (boleto.telephone == null ||
        boleto.telephone.isEmpty ||
        boleto.telephone.length < 8) {
      return "Telefone obrigatório";
    }
    return null;
  }

  //validador de Value
  String validateValue() {
    if (boleto.value == null || boleto.value < 10) {
      return "O valor minimo é R\$ 10,00";
    }
    return null;
  }

  //validador de Vencimento
  String validateDateExpiration() {
    if (boleto.dateExpiration == null) {
      return "Vencimento obrigatório";
    }
    if (boleto.dateExpiration.isBefore(DateTime.now())) {
      return "Data de vencimento inválida";
    }
    return null;
  }

  // dados computados, dados derivados de boleto(reatividade) existente ou de outros dados computados
  @computed
  bool get isValid {
    return validateName() == null &&
        validateEmail() == null &&
        validateDocument() == null &&
        validateDdd() == null &&
        validateTelephone() == null &&
        validateValue() == null &&
        validateDateExpiration() == null;
  }

  dynamic createTransctionBoleto() async {
    return service.createTransactionBoleto(boleto);
  }
}
