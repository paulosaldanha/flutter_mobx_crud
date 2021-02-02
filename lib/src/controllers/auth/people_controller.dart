import 'package:mobx/mobx.dart';
import 'package:ecommerceBankPay/src/models/people.dart';
import 'package:cpfcnpj/cpfcnpj.dart';

//nome_da_classe.g.dar usado pelo mobx para reatividade, criado dinamicamente (evita boilerplate)
part 'people_controller.g.dart';

class PeopleController = _PeopleController with _$PeopleController;

abstract class _PeopleController with Store {
  _PeopleController();

  People people = People();

  @observable
  String confirmPassword;
  @observable
  bool passwordVisible = true;
  @observable
  bool confirmPasswordVisible = true;
  @observable
  bool loading = false;

  @action
  setConfirmPassword(String value) => confirmPassword = value;
  @action
  visibilityPassword() => passwordVisible = !passwordVisible;
  @action
  visibilityConfirmPassword() =>
      confirmPasswordVisible = !confirmPasswordVisible;

  // Validação de Documento
  @computed
  bool get validDocument =>
      people.document != null && CPF.isValid(people.document) ||
      CNPJ.isValid(people.document);
  String get documentError {
    if (people.document == null || validDocument) {
      return null;
    } else if (people.document != null || people.document.isEmpty) {
      return "Documento obrigatório";
    } else {
      return "Documento Inválido";
    }
  }

  // Validação de Nome
  @computed
  bool get validName =>
      people.name != null &&
      people.name.length >= 4 &&
      people.name.length <= 60;
  String get nameError {
    if (people.name == null || validName) {
      return null;
    } else if (people.name != null && people.name.isEmpty) {
      return "Nome Obrigatório";
    } else {
      return "Nome deve conter entre 4 e 60 caracteres";
    }
  }

  // Validação de Telefone
  @computed
  bool get validTelephone =>
      people.telephone != null && people.telephone.length == 16;
  String get telephoneError {
    if (people.telephone == null || validTelephone) {
      return null;
    } else if (people.telephone == null && people.telephone.isEmpty) {
      return "Telefone obrigatório";
    } else {
      return "Telefone deve conter 11 digitos";
    }
  }

  // Validação de CEP
  @computed
  bool get validCep => people.cep != null && people.cep.length == 9;
  String get cepError {
    if (people.cep == null || validCep) {
      return null;
    } else {
      return "CEP obrigatório";
    }
  }

  // Validação de Rua
  @computed
  bool get validRua => people.rua != null && people.rua.length > 0;
  String get ruaError {
    if (people.rua == null || validRua) {
      return null;
    } else {
      return "Rua obrigatório";
    }
  }

  // Validação de Número
  @computed
  bool get validNumero => people.numero != null && people.numero.length > 0;
  String get numeroError {
    if (people.numero == null || validNumero) {
      return null;
    } else {
      return "Numero obrigatório";
    }
  }

  // Validação de Email
  @computed
  bool get validEmail =>
      people.email != null &&
      people.email.length >= 4 &&
      people.email.contains("@") &&
      people.email.contains(".");
  String get emailError {
    if (people.email == null || validEmail) {
      return null;
    } else if (people.email != null || people.email.isEmpty) {
      return "Email obrigatório";
    } else {
      return "Email Inválido";
    }
  }

  // Validação de Senha
  @computed
  bool get validPassword =>
      people.password != null &&
      people.password.length >= 8 &&
      people.password.length <= 32;
  String get passwordError {
    if (people.password == null || validPassword) {
      return null;
    } else if (people.password != null && people.password.isEmpty) {
      return "Senha deve conter entre 8 e 32 caracteres";
    } else {
      return "Senha obrigatória";
    }
  }

  // Validação de Confirmação de Senha
  @computed
  bool get validConfirmPassword =>
      confirmPassword != null && confirmPassword == people.password;
  String get confirmPasswordError {
    if (confirmPassword == null || validConfirmPassword) {
      return null;
    } else {
      return "As senhas precisam ser identicas";
    }
  }

  @computed
  bool get isValid {
    return validDocument &&
        validName &&
        validTelephone &&
        validCep &&
        validRua &&
        validNumero &&
        validEmail &&
        validPassword &&
        validConfirmPassword &&
        !loading;
  }

  dynamic createTransctionPeople() async {
    return null; //createTransactionPeople(people);
  }
}
