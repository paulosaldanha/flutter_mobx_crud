import 'package:estruturabasica/src/models/auth_model.dart';
import 'package:estruturabasica/src/util/authMap.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'https://ecommercebank.tk/ecommerce/api/usuario/login';
  String getError = '';
  String getAuthToken = '';
  AuthService();

  Future<Auth> authenticate(Auth auth) async {
    final authretorno = await http.post(baseUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(auth.toJson()));
    var retorno = json.decode(authretorno.body);
    if (authretorno.statusCode == 200) {
      await login(retorno["accessToken"]);
      getAuthToken = retorno["accessToken"];
      Auth auth = Auth.fromMap(json.decode(authretorno.body));
      AuthMap.setAuthMap(auth);
      auth.setIsLogged(true);
      return auth;
    } else {
      getError = retorno["message"];
      auth.setIsLogged(false);
      auth.seterrorMsg(getError);
      return auth;
      // return Auth.fromMap(json.decode(authretorno.body));
    }
  }

  Future<bool> login_erro(dynamic error) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('error', error);
    return true;
  }

  Future<bool> login(dynamic jwt) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('jwt', jwt);
    return true;
  }

  Future<bool> autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jwt = prefs.getString('jwt');
    if (jwt == null) {
      return false;
    }
    return true;
  }

  static Future<bool> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('jwt', null);
    return false;
  }

  Future<String> checkIfUserIsLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jwt = prefs.getString('jwt');
    if (jwt == null) {
      return "";
    }
    return jwt;
  }
}
