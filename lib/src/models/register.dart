import 'package:mobx/mobx.dart';

part 'register.g.dart';

class Register = _Register with _$Register;

abstract class _Register with Store {
  @observable
  String razaoSocial;
  @action
  void setRazaoSocial(String value) => razaoSocial = value;

  @observable
  String cnpj;
  @action
  void setcnpj(String value) => cnpj = value;

  @observable
  String responsavelEmail;
  @action
  void setResponsavelEmail(String value) => responsavelEmail = value;

  @observable
  String responsavel;
  @action
  void setResponsavel(String value) => responsavel = value;

  @observable
  String senha;
  @action
  void setSenha (String value) => senha = value;

}