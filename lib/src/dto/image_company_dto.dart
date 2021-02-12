import 'dart:io';

import 'package:ecommerceBankPay/src/models/auth_model.dart';

class ImageCompanyDto {
  ImageCompanyDto();
  Auth auth;
  File file;
  String urlImage;
  String token;

  ImageCompanyDto.fromMapSave(String token) {
    this.token = token ?? "";
  }

  ImageCompanyDto.fromMapImage(Map<String, dynamic> map) {
    this.urlImage = map['url'] ?? "";
  }
}
