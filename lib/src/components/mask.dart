import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

maskCpf() {
  return MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
}

maskCnpj() {
  return MaskTextInputFormatter(
      mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});
}

maskDdd() {
  return MaskTextInputFormatter(mask: '##', filter: {"#": RegExp(r'[0-9]')});
}

maskPhone() {
  return MaskTextInputFormatter(
      mask: '# ####-####', filter: {"#": RegExp(r'[0-9]')});
}

maskDDDPhone() {
  return MaskTextInputFormatter(
      mask: '(##) # ####-####', filter: {"#": RegExp(r'[0-9]')});
}

maskCardNumber() {
  return MaskTextInputFormatter(
      mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});
}

maskDateExp() {
  return MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
}

maskCvv() {
  return MaskTextInputFormatter(mask: '####', filter: {"#": RegExp(r'[0-9]')});
}

maskCep() {
  return MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
}
