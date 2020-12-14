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
  String validateNome() {
    if (boleto.nome == null || boleto.nome.isEmpty || boleto.nome.length < 3) {
      return "Nome obrigatório";
    }
    return null;
  }

  //validador de email
  String validateEmail() {
    if (boleto.email == null ||
        boleto.email.length < 4 ||
        !boleto.email.contains("@") ||
        !boleto.email.contains(".")) {
      return "Email inválido";
    }
    return null;
  }

  //validador de documento
  String validateDocumento() {
    if (boleto.documento == null || boleto.documento.isEmpty) {
      return "Documento obrigatório";
    }
    if (CPF.isValid(boleto.documento) || CNPJ.isValid(boleto.documento)) {
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

  //validador de Telefone
  String validateTelefone() {
    if (boleto.telefone == null ||
        boleto.telefone.isEmpty ||
        boleto.telefone.length < 8) {
      return "Telefone obrigatório";
    }
    return null;
  }

  //validador de Valor
  String validateValor() {
    if (boleto.valor == null || boleto.valor < 10) {
      return "O valor minimo é R\$ 10,00";
    }
    return null;
  }

  //validador de Vencimento
  String validateVencimento() {
    if (boleto.vencimento == null) {
      return "Vencimento obrigatório";
    }
    if (boleto.vencimento.isBefore(DateTime.now())) {
      return "Data de vencimento inválida";
    }
    return null;
  }

  // dados computados, dados derivados de boleto(reatividade) existente ou de outros dados computados
  @computed
  bool get isValid {
    return validateNome() == null &&
        validateEmail() == null &&
        validateDocumento() == null &&
        validateDdd() == null &&
        validateTelefone() == null &&
        validateValor() == null &&
        validateVencimento() == null;
  }

  dynamic createTransctionBoleto() async {
    return service.createTransactionBoleto(boleto);
  }
}
