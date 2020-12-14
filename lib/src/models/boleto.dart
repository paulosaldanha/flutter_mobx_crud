import 'package:mobx/mobx.dart';

part 'boleto.g.dart';

// cria a classe baseado no base e no que foi gerado. _$NomeDaClasse é a forma como é gerado por padrão
class Boleto = _BoletoBase with _$Boleto;

//Store sinaliza que a classe esta apta a geração de codigo automatica do mobx
abstract class _BoletoBase with Store {
  @observable
  String nome;
  @observable
  String email;
  @observable
  String documento;
  @observable
  String ddd;
  @observable
  String telefone;
  @observable
  double valor;
  @observable
  DateTime vencimento;

  String mensagem;

//getter and setter
  @action
  setNome(String value) => nome = value;
  @action
  setEmail(String value) => email = value;
  @action
  setDocumento(String value) => documento = value;
  @action
  setDdd(String value) => ddd = value;
  @action
  setTelefone(String value) => telefone = value;
  @action
  setValor(String value) => valor = double.parse(value);
  @action
  setVencimento(DateTime value) => vencimento = value;
  @action
  setMensagem(String value) => mensagem = value;
}
