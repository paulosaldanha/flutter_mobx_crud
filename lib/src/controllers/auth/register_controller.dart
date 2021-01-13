import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/register.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:estruturabasica/src/services/register_service.dart';

//nome_da_classe.g.dar usado pelo mobx para reatividade, criado dinamicamente (evita boilerplate)
part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  _RegisterController();

  //referente ao formulario de inserção
  var register = Register();

  bool validCompanyName = false;
  bool validDocument = false;
  bool validName = false;
  bool validCep = false;
  bool validRua = false;
  bool validNumero = false;
  bool validEmail = false;
  bool validPassword = false;
  bool validConfirmPassword = false;
  String suffixDocument = "";

  @observable
  String confirmPassword;
  @observable
  bool passwordVisible = true;
  @observable
  bool confirmPasswordVisible = true;

  @action
  setConfirmPassword(value) => confirmPassword = value;
  @action
  visibilityPassword() => passwordVisible = !passwordVisible;
  @action
  visibilityConfirmPassword() =>
      confirmPasswordVisible = !confirmPasswordVisible;

  //validador de nome
  String validateCompanyName() {
    if (register.razaoSocial == null) {
      validCompanyName = false;
      return null;
    } else if (register.razaoSocial.isEmpty ||
        register.razaoSocial.length < 4 ||
        register.razaoSocial.length > 60) {
      validCompanyName = false;
      return "A Razão Social deve conter entre 4 e 60 caracteres";
    }
    validCompanyName = true;
    return null;
  }

  //validador de documento
  String validateDocument() {
    if (register.documento == null) {
      validDocument = false;
      return null;
    }

    if (register.documento.isEmpty) {
      validDocument = false;
      return "Documento obrigatório";
    }

    if (register.documento.length <= 9) {
      suffixDocument = "RUC";
      validDocument = true;
      return null;
    } else if (register.documento.length > 9 &&
        register.documento.length < 12) {
      suffixDocument = "CPF";
      validDocument = false;
      if (CPF.isValid(register.documento)) {
        validDocument = true;
        return null;
      } else {
        validDocument = false;
        return "CPF inválido";
      }
    } else if (register.documento.length > 11 &&
        register.documento.length < 15) {
      suffixDocument = "CNPJ";
      if (CNPJ.isValid(register.documento)) {
        validDocument = true;
        return null;
      } else {
        validDocument = false;
        return null;
      }
    }
    validDocument = false;
    return null;
  }

  //validador de Nome Responsavel
  String validateName() {
    if (register.responsavel == null) {
      validName = false;
      return null;
    } else if (register.responsavel.isEmpty ||
        register.responsavel.length < 4 ||
        register.responsavel.length > 60) {
      validName = false;
      return "O nome do reponsável deve conter entre 4 e 60 caracteres";
    }
    validName = true;
    return null;
  }

  //validação de CEP
  String validateCep() {
    if (register.cep == null) {
      validCep = false;
      return null;
    }
    validCep = true;
    return null;
  }

  //validação de Rua
  String validateRua() {
    if (register.rua == null) {
      validRua = false;
      return null;
    }
    validRua = true;
    return null;
  }

  //validação de CEP
  String validateNumero() {
    if (register.numero == null) {
      validNumero = false;
      return null;
    }
    validNumero = true;
    return null;
  }

  //validador de Email
  String validateEmail() {
    if (register.responsavelEmail == null) {
      validEmail = false;
      return null;
    }
    if (register.responsavelEmail.isEmpty) {
      validEmail = false;
      return "Email obrigatório";
    }
    if (register.responsavelEmail.length < 4 ||
        !register.responsavelEmail.contains("@") ||
        !register.responsavelEmail.contains(".")) {
      validEmail = false;
      return "Email inválido";
    }
    validEmail = true;
    return null;
  }

  //validador de Senha
  String validatePassword() {
    if (register.senha == null) {
      validPassword = false;
      return null;
    }
    if (register.senha.isEmpty) {
      validPassword = false;
      return "Senha obrigatória";
    }
    if (register.senha.length < 8 || register.senha.length > 32) {
      validPassword = false;
      return "Senha deve conter de 8 a 32 caracteres";
    }
    validPassword = true;
    return null;
  }

  //Confirmação de Senha
  String validateConfirmPassword() {
    if (confirmPassword == null) {
      validConfirmPassword = false;
      return null;
    }
    if (confirmPassword.length < 8 || confirmPassword.length > 32) {
      validConfirmPassword = false;
      return "Senha deve conter de 8 a 32 caracteres";
    }
    if (confirmPassword == register.senha) {
      validConfirmPassword = true;
      return null;
    }
    validConfirmPassword = false;
    return "As senhas não conferem";
  }

  bool validate() {
    if (validCompanyName &&
        validDocument &&
        validName &&
        validEmail &&
        validPassword &&
        validConfirmPassword) {
      return true;
    }
    return false;
  }

  // dados computados, dados derivados de register(reatividade) existente ou de outros dados computados
  @computed
  bool get isValid {
    return validateCompanyName() == null &&
        validateDocument() == null &&
        validateName() == null &&
        validateEmail() == null &&
        validatePassword() == null &&
        validateConfirmPassword() == null &&
        validate() == true;
  }

  dynamic createFastAccount() async {
    return createAccount(register);
  }
}
