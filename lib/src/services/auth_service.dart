import 'package:dio/dio.dart';
import 'package:ecommerceBankPay/src/models/auth_model.dart';
import 'package:ecommerceBankPay/src/util/authMap.dart';
import 'dart:convert';
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
