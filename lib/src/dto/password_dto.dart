import 'dart:convert';

class PasswordDto {
  PasswordDto(this.oldPassword, this.newPassword, this.confirmPassword);

  String oldPassword;
  String newPassword;
  String confirmPassword;
  String jwt;

  PasswordDto.fromMap(String jwt) {
    jwt = jwt ?? "";
  }

  dynamic toJson() {
    Map<String, Object> payload = Map();
    payload["senhaAtual"] = oldPassword;
    payload["senhaNova"] = newPassword;
    payload["senhaNovaConfirmacao"] = confirmPassword;
    return jsonEncode(payload);
  }
}
