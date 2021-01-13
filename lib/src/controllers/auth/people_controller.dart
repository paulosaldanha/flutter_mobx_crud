import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/people.dart';
import 'package:cpfcnpj/cpfcnpj.dart';

//nome_da_classe.g.dar usado pelo mobx para reatividade, criado dinamicamente (evita boilerplate)
part 'people_controller.g.dart';

class PeopleController = _PeopleController with _$PeopleController;

abstract class _PeopleController with Store {
  _PeopleController();

  People people = People();

  bool validName = false;
  bool validEmail = false;
  bool validDocument = false;
  bool validTelephone = false;
  bool validCep = false;
  bool validRua = false;
  bool validNumero = false;
  bool validComplemento = false;
  bool validPassword = false;
  bool confirmValidPassword = false;

  @observable
  String confirmPassword;
  @observable
  bool passwordVisible = true;
  @observable
  bool confirmPasswordVisible = true;

  @action
  setConfirmPassword(String value) => confirmPassword = value;
  @action
  visibilityPassword() => passwordVisible = !passwordVisible;
  @action
  visibilityConfirmPassword() =>
      confirmPasswordVisible = !confirmPasswordVisible;

  //validador de nome
  String validateName() {
    if (people.name == null) {
      validName = false;
      return null;
    } else if (people.name.isEmpty ||
        people.name.length < 4 ||
        people.name.length > 60) {
      validName = false;
      return "O nome deve conter entre 4 e 60 caracteres";
    }
    validName = true;
    return null;
  }

  //validador de document
  String validateDocument() {
    if (people.document == null) {
      validDocument = false;
      return null;
    }
    if (people.document.isEmpty) {
      validDocument = false;
      return "Documento obrigatório";
    } else if (CPF.isValid(people.document) || CNPJ.isValid(people.document)) {
      validDocument = true;
      return null;
    } else {
      validDocument = false;
      return "Documento Inválido";
    }
  }

  //validador de Telephone
  String validateTelephone() {
    if (people.telephone == null) {
      validTelephone = false;
      return null;
    } else if (people.telephone.isEmpty) {
      validTelephone = false;
      return "Telefone obrigatório";
    } else if (!(people.telephone.length == 16)) {
      validTelephone = false;
      return "Telefone deve contar 11 digitos";
    }
    validTelephone = true;
    return null;
  }

  String validateEmail() {
    if (people.email == null) {
      validEmail = false;
      return null;
    }
    if (people.email.isEmpty) {
      validEmail = false;
      return "Email obrigatório";
    }
    if (people.email.length < 4 ||
        !people.email.contains("@") ||
        !people.email.contains(".")) {
      validEmail = false;
      return "Email inválido";
    }
    validEmail = true;
    return null;
  }

  //validador de Senha
  String validatePassword() {
    if (people.password == null) {
      validPassword = false;
      return null;
    }
    if (people.password.isEmpty) {
      validPassword = false;
      return "Senha obrigatória";
    }
    if (people.password.length < 8 || people.password.length > 32) {
      validPassword = false;
      return "Senha deve conter de 8 a 32 caracteres";
    }
    validPassword = true;
    return null;
  }

  //Confirmação de Senha
  String validateConfirmPassword() {
    if (confirmPassword == null) {
      confirmValidPassword = false;
      return null;
    }
    if (confirmPassword.length < 8 || confirmPassword.length > 32) {
      confirmValidPassword = false;
      return "Senha deve conter de 8 a 32 caracteres";
    }
    if (confirmPassword == people.password) {
      confirmValidPassword = true;
      return null;
    }
    confirmValidPassword = false;
    return "As senhas não conferem";
  }

  //validação de CEP
  String validateCep() {
    if (people.cep == null) {
      validCep = false;
      return null;
    }
    validCep = true;
    return null;
  }

  //validação de Rua
  String validateRua() {
    if (people.rua == null) {
      validRua = false;
      return null;
    }
    validRua = true;
    return null;
  }

  //validação de CEP
  String validateNumero() {
    if (people.numero == null) {
      validNumero = false;
      return null;
    }
    validNumero = true;
    return null;
  }

  bool validate() {
    if (validName && validDocument && validTelephone) {
      return true;
    }
    return false;
  }

  // dados computados, dados derivados de people(reatividade) existente ou de outros dados computados
  @computed
  bool get isValid {
    return validateName() == null &&
        validateDocument() == null &&
        validateTelephone() == null &&
        validate() == true;
  }

  dynamic createTransctionPeople() async {
    return null; //createTransactionPeople(people);
  }
}
