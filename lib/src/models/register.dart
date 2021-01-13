import 'package:mobx/mobx.dart';

part 'register.g.dart';

class Register = _Register with _$Register;

abstract class _Register with Store {
  @observable
  String razaoSocial;
  @observable
  String documento;
  @observable
  String responsavel;
  @observable
  String responsavelEmail;
  @observable
  String senha;
  @observable
  String cep;
  @observable
  String rua;
  @observable
  String numero;
  @observable
  String complemento;

  @action
  void setRazaoSocial(String value) => razaoSocial = value;
  @action
  void setdocumento(String value) => documento = value;
  @action
  void setResponsavel(String value) => responsavel = value;
  @action
  void setResponsavelEmail(String value) => responsavelEmail = value;
  setCep(String value) => cep = value;
  @action
  setRua(String value) => rua = value;
  @action
  setNumero(String value) => numero = value;
  @action
  setComplemento(String value) => complemento = value;
  @action
  void setSenha(String value) => senha = value;
}
