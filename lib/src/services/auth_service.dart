import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerceBankPay/src/dto/image_company_dto.dart';
import 'package:ecommerceBankPay/src/models/auth_model.dart';
import 'package:ecommerceBankPay/src/util/authMap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);

  Future<Auth> authenticate(Auth auth) async {
    try {
      final res = await dio.post('/usuario/login', data: jsonEncode(auth));
      if (res.statusCode == 200) {
        Auth auth = Auth.fromMap(res.data);
        AuthMap.setAuthMap(auth);
        auth.setIsLogged(true);
        return auth;
      } else {
        auth.setIsLogged(false);
        auth.seterrorMsg(res.data["message"]);
        return auth;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ImageCompanyDto> changeImageCompany(ImageCompanyDto imageDto) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      FormData formData = new FormData.fromMap({
        "file": await MultipartFile.fromFile(imageDto.file.path,
            filename: "upload.jpg"),
      });
      final response = await dio.post('/file/upload', data: formData);
      ImageCompanyDto imageCompanyDto = new ImageCompanyDto();
      ImageCompanyDto.fromMapImage(response.data);
      imageDto.auth.companyLogo = imageCompanyDto.urlImage;

      return imageCompanyDto;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jwt = prefs.getString('token');
    if (jwt == null) {
      return false;
    }
    return true;
  }

  static Future<bool> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', null);
    return false;
  }

  Future<String> checkIfUserIsLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jwt = prefs.getString('token');
    if (jwt == null) {
      return "";
    }
    return jwt;
  }
}
