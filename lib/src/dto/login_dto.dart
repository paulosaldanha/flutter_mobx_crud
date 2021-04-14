class LoginDto {
  final String username;
  final String password;

  LoginDto(this.username, this.password);

  Map<String, dynamic> toJson() => {"login": username, "password": password};
}