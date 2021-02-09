import 'package:ecommerceBankPay/src/api/api.dart';
import 'package:ecommerceBankPay/src/services/register_service.dart';
import 'package:mobx/mobx.dart';
import 'package:ecommerceBankPay/src/models/register.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  _RegisterController();

  var register = Register();
  var service = RegisterService(Api());

  @observable
  String confirmPassword = "";
  @observable
  bool passwordVisible = true;
  @observable
  bool confirmPasswordVisible = true;
  @observable
  bool loading = false;

  String suffixDocument = "";

  @action
  setConfirmPassword(value) => confirmPassword = value;
  @action
  visibilityPassword() => passwordVisible = !passwordVisible;
  @action
  visibilityConfirmPassword() =>
      confirmPasswordVisible = !confirmPasswordVisible;

  // Validação de Documento
  @computed
  bool get validDocument =>
      register.documento != null &&
      ((register.documento.length > 7 && register.documento.length < 10) ||
          CPF.isValid(register.documento) ||
          CNPJ.isValid(register.documento));
  String get documentError {
    if (register.documento == null || register.documento.length <= 9) {
      suffixDocument = "RUC";
    } else if (register.documento.length > 9 &&
        register.documento.length < 12) {
      suffixDocument = "CPF";
    } else {
      suffixDocument = "CNPJ";
    }

    if (register.documento == null || validDocument) {
      return null;
    } else if (register.documento != null && register.documento.isEmpty) {
      return "Documento obrigátorio";
    } else {
      return "Documento inválido";
    }
  }

  // Validação de Razão Social
  @computed
  bool get validCompanyName =>
      register.razaoSocial != null &&
      register.razaoSocial.length >= 4 &&
      register.razaoSocial.length <= 60;
  String get companyNameError {
    print(register.razaoSocial);
    if (register.razaoSocial == null || validCompanyName) {
      return null;
    } else if (register.razaoSocial != null && register.razaoSocial.isEmpty) {
      return "Razão Social obrigátorio";
    } else {
      return "A Razão Social deve conter entre 4 e 60 caracteres";
    }
  }

  // Validação de Nome
  @computed
  bool get validName =>
      register.responsavel != null &&
      register.responsavel.length >= 4 &&
      register.responsavel.length <= 60;
  String get nameError {
    if (register.responsavel == null || validName) {
      return null;
    } else if (register.responsavel != null && register.responsavel.isEmpty) {
      return "Nome obrigatório";
    } else {
      return "Nome deve ter entre 4 e 60 caracteres";
    }
  }

  // Validação de CEP
  @computed
  bool get validCep => register.cep != null && register.cep.length == 9;
  String get cepError {
    if (register.cep == null || validCep) {
      return null;
    } else {
      return "CEP obrigatório";
    }
  }

  // Validação de Rua
  @computed
  bool get validRua => register.rua != null && register.rua.length > 0;
  String get ruaError {
    if (register.rua == null || validRua) {
      return null;
    } else {
      return "Rua obrigatório";
    }
  }

  // Validação de Número
  @computed
  bool get validNumero => register.numero != null && register.numero.length > 0;
  String get numeroError {
    if (register.numero == null || validNumero) {
      return null;
    } else {
      return "Numero obrigatório";
    }
  }

  // Validação de Email
  @computed
  bool get validEmail =>
      register.responsavelEmail != null &&
      register.responsavelEmail.length >= 4 &&
      register.responsavelEmail.contains("@") &&
      register.responsavelEmail.contains(".");
  String get emailError {
    if (register.responsavelEmail == null || validEmail) {
      return null;
    } else if (register.responsavelEmail != null &&
        register.responsavelEmail.isEmpty) {
      return "Email obrigatório";
    } else {
      return "Email invalido";
    }
  }

  // Validação de Senha
  @computed
  bool get validPassword =>
      register.senha != null &&
      register.senha.length >= 8 &&
      register.senha.length <= 32;
  String get passwordError {
    if (register.senha == null || validPassword) {
      return null;
    } else if (register.senha != null && register.senha.isEmpty) {
      return "Senha deve ter entre 8 e 32 caracteres";
    } else {
      return "Senha obrigatória";
    }
  }

  // Validação de Confirmação de Senha
  @computed
  bool get validConfirmPassword =>
      confirmPassword.length != null && confirmPassword == register.senha;
  String get confirmPasswordError {
    if (confirmPassword == null || validConfirmPassword) {
      return null;
    } else {
      return "As senhas precisam ser identicas";
    }
  }

  // Verifica se todas validções estão corretas
  @computed
  bool get isValid {
    return validCompanyName &&
        validDocument &&
        validName &&
        validCep &&
        validRua &&
        validNumero &&
        validEmail &&
        validPassword &&
        validConfirmPassword &&
        !loading;
  }

  // Envia o objeto para a service
  dynamic createFastAccount() async {
    return service.createAccount(register);
  }

  // Limpa o objeto
  void cleanData() {
    register.documento = null;
    register.razaoSocial = null;
    register.responsavel = null;
    register.cep = null;
    register.rua = null;
    register.numero = null;
    register.complemento = null;
    register.responsavelEmail = null;
    register.senha = null;
    confirmPassword = null;
  }
}
