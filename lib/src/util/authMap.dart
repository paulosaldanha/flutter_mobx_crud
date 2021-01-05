import 'package:estruturabasica/src/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMap {

  static setAuthMap (Auth auth) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('authUserId', auth.userId);
    prefs.setInt('authCompanyId', auth.companyId);
    prefs.setString('authNameCompany', auth.nameCompany);
    prefs.setString('authUserName', auth.name);
  }

  static Future<Auth> getAuthMap () async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Auth auth = Auth();
    auth.name = prefs.getString('authUserName');
    auth.nameCompany = prefs.getString('authNameCompany');
    auth.companyId = prefs.getInt('authCompanyId');
    auth.userId = prefs.getInt('authUserId');
    return auth;
  }

}